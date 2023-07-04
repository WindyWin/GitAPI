import 'package:flutter/material.dart';
import 'package:git_api/view_model/github_view_model.dart';
import 'package:provider/provider.dart';

class AddRepoView extends StatefulWidget {
  const AddRepoView({super.key});

  @override
  State<AddRepoView> createState() => _AddRepoViewState();
}

class _AddRepoViewState extends State<AddRepoView> {
  final _formKey = GlobalKey<FormState>();
  String name = "";
  String description = "";
  String homepage = "https://github.com";
  bool private = false;
  bool isTemplate = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Repository'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Repository name',
                    ),
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter a name' : null,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Description',
                    ),
                  ),
                  // TextFormField(
                  //   readOnly: true,
                  //   decoration: const InputDecoration(
                  //     hintText: 'Homepage',
                  //   ),
                  //   initialValue: homepage,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Private:"),
                      Switch(
                        value: private,
                        onChanged: (value) {
                          setState(() {
                            private = value;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Template:"),
                      Switch(
                        value: isTemplate,
                        onChanged: (value) {
                          setState(() {
                            isTemplate = value;
                          });
                        },
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Processing Data'),
                              duration: Duration(seconds: 30)),
                        );
                        context
                            .read<GithubVM>()
                            .createRepository(name, description, homepage,
                                private, isTemplate)
                            .then((value) {
                          ScaffoldMessenger.of(context).removeCurrentSnackBar();
                          if (value = true) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Repository created'),
                              ),
                            );
                            Navigator.of(context).pop();

                            context.read<GithubVM>().getRepo();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('There was an error'),
                              ),
                            );
                          }
                        });
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
