import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:tasknaut_mobile/components/styled_text_field.dart';
import 'package:tasknaut_mobile/constants.dart';

class CreateProjectForm extends StatefulWidget {
  const CreateProjectForm({super.key, required this.ctx});
  final BuildContext ctx;

  @override
  State<CreateProjectForm> createState() => _CreateProjectFormState();
}

class _CreateProjectFormState extends State<CreateProjectForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _name = '';

  @override
  Widget build(BuildContext context) {
    return Query(
        options: QueryOptions(
            document: gql(kMyProjectsGql), fetchPolicy: FetchPolicy.cacheOnly),
        builder: (QueryResult queryResultData, {fetchMore, refetch}) =>
            Mutation(
                options: MutationOptions(
                    document: gql(kCreateProjectGql),
                    update: (cache, result) {
                      if (result?.hasException == false &&
                          result?.isLoading == false &&
                          result?.data != null) {
                        cache.writeQuery(
                            Request(
                                operation:
                                    Operation(document: gql(kMyProjectsGql))),
                            data: {
                              '__typename': '[Project]',
                              'myProjects': [
                                ...queryResultData.data?['myProjects'],
                                result!.data?['createProject']
                              ]
                            });
                      }
                    },
                    onCompleted: (result) {
                      if (result?['createProject'] != null) {
                        Navigator.pop(widget.ctx);
                      }
                    }),
                builder: (RunMutation runMutation, result) {
                  return Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          const SizedBox(height: 20.0),
                          StyledTextField(
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
                                    'input': {'name': _name}
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
