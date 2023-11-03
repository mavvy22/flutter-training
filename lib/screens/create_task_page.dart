import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:tasknaut_mobile/components/project_dropdown.dart';
import 'package:tasknaut_mobile/components/styled_text_field.dart';
import 'package:tasknaut_mobile/constants.dart';
import 'package:tasknaut_mobile/utils/create_app_bar.dart';

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage({super.key});

  static String routeName = '/main/tasks/add';

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _projectController = TextEditingController();

  String _name = '';
  String? _description;
  String _projectId = '';

  @override
  Widget build(BuildContext context) {
    return Mutation(
        options: MutationOptions(document: gql(kAddTask)),
        builder: (RunMutation runMutation, result) => Scaffold(
              appBar: createAppBar(title: 'Add Task'),
              body: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Row(children: [
                            ProjectDropdown(
                              onChange: (value) {
                                _projectId = value!;
                              },
                              controller: _projectController,
                            )
                          ]),
                          const SizedBox(
                            height: 20.0,
                          ),
                          StyledTextField(
                            hintText: 'Name',
                            onSaved: (val) {
                              _name = val!;
                            },
                            validator: (val) {
                              if (val != null && val != '') {
                                return null;
                              }
                              return 'Invalid Input';
                            },
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Description',
                              hintStyle: TextStyle(color: Colors.white70),
                            ),
                            maxLines: 5,
                            minLines: 5,
                            onSaved: (val) {
                              _description = val;
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          FilledButton(
                              onPressed: () {
                                bool isValid =
                                    _formKey.currentState!.validate();
                                if (isValid) {
                                  _formKey.currentState!.save();
                                  runMutation({
                                    'input': {
                                      'name': _name,
                                      'description': _description,
                                      'projectId': _projectId
                                    }
                                  });
                                }
                              },
                              child: const Text('Save'))
                        ],
                      ))),
            ));
  }
}
