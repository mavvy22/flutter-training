import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:tasknaut_mobile/components/styled_text_field.dart';
import 'package:tasknaut_mobile/constants.dart';

class UpdateProjectForm extends StatefulWidget {
  const UpdateProjectForm(
      {super.key,
      required this.name,
      required this.description,
      required this.id,
      required this.ctx});

  final String name;
  final String? description;
  final String id;
  final BuildContext ctx;

  @override
  State<UpdateProjectForm> createState() => _UpdateProjectFormState();
}

class _UpdateProjectFormState extends State<UpdateProjectForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _name = '';
  String? _description = '';

  @override
  Widget build(BuildContext context) {
    return Query(
        options: QueryOptions(
            document: gql(kMyProjectsGql), fetchPolicy: FetchPolicy.cacheOnly),
        builder: (QueryResult queryResultData, {fetchMore, refetch}) =>
            Mutation(
                options: MutationOptions(
                    document: gql(kUpdateProjectGql),
                    update: (cache, result) {
                      if (result?.hasException == false &&
                          result?.isLoading == false &&
                          result?.data != null) {
                        dynamic updatedData =
                            queryResultData.data?['myProjects'].map((item) {
                          if (item['id'] != widget.id) {
                            return item;
                          }
                          return result!.data?['updateProject'];
                        });
                        cache.writeQuery(
                            Request(
                                operation:
                                    Operation(document: gql(kMyProjectsGql))),
                            data: {
                              '__typename': '[Project]',
                              'myProjects': [...updatedData]
                            });
                      }
                    },
                    onCompleted: (result) {
                      if (result?['updateProject'] != null) {
                        const snackBar =
                            SnackBar(content: Text('Successfully Saved'));
                        ScaffoldMessenger.of(widget.ctx).showSnackBar(snackBar);
                      }
                    }),
                builder: (RunMutation runMutation, result) {
                  return Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          const SizedBox(height: 20.0),
                          StyledTextField(
                            initialValue: widget.name,
                            hintText: 'Name',
                            onSaved: (val) {
                              _name = val!;
                            },
                            validator: (value) {
                              if (value != null && value != '') {
                                return null;
                              }
                              return 'Invalid Input';
                            },
                          ),
                          const SizedBox(height: 20.0),
                          TextFormField(
                            initialValue: widget.description,
                            minLines: 5,
                            maxLines: 5,
                            onSaved: (val) {
                              _description = val;
                            },
                            decoration: const InputDecoration(
                                hintText: 'Description',
                                hintStyle: TextStyle(color: Colors.white70)),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          FilledButton(
                              onPressed: () {
                                bool? isValid =
                                    _formKey.currentState?.validate();
                                if (isValid == true) {
                                  _formKey.currentState?.save();
                                  runMutation({
                                    'input': {
                                      'name': _name,
                                      'description': _description,
                                      'id': widget.id
                                    }
                                  });
                                }
                              },
                              child: const Text(
                                'Save',
                                style: TextStyle(fontSize: 17.0),
                              ))
                        ],
                      ));
                }));
  }
}
