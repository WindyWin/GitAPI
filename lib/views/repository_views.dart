import 'package:flutter/material.dart';
import 'package:git_api/data/models/repository.dart';
import 'package:git_api/view_model/github_view_model.dart';
import 'package:git_api/views/add_repo_view.dart';
import 'package:provider/provider.dart';

class RepositoryView extends StatelessWidget {
  const RepositoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: const Text("Repository"), actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const AddRepoView()));
            },
            child: const Text("Add new repo"))
      ]),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextFormField(
              initialValue: context.read<GithubVM>().repoKeyword,
              decoration: const InputDecoration(
                labelText: "Search repo name",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                context.read<GithubVM>().repoKeyword = value;
              },
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                context.read<GithubVM>().getRepo();
              },
              child: Consumer<GithubVM>(
                builder: (context, githubVM, child) {
                  if (githubVM.loading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (githubVM.listRepo.isEmpty) {
                    return const Center(child: Text("No repository"));
                  }
                  final List<Repository> listRepo = githubVM.listRepo;
                  return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final Repository repository = listRepo[index];
                      return Card(
                        child: ListTile(
                          title: Text(
                            "${repository.owner!.login ?? ""}/${repository.name ?? ""}",
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(repository.description ?? ""),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                    itemCount: listRepo.length,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
