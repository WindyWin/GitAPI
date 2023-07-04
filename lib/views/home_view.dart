import 'package:flutter/material.dart';
import 'package:git_api/data/service/github_service.dart';
import 'package:git_api/view_model/github_view_model.dart';
import 'package:git_api/views/repository_views.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: const Text("Profile"),
          actions: [
            IconButton(
                onPressed: () async {
                  GithubService githubService = GithubService();
                  githubService.client.setHeaderAuth("");
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Consumer<GithubVM>(
            builder: (context, githubVM, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                      radius: 100,
                      backgroundImage:
                          NetworkImage(githubVM.userProfile?.avatarUrl ?? "")),
                  Text(
                    githubVM.userProfile?.login ?? "",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text("bio: ${githubVM.userProfile?.bio ?? "null"}"),
                  Text("email: ${githubVM.userProfile?.email ?? "null"}"),
                  Text("company: ${githubVM.userProfile?.company ?? "null"}"),
                  Text("location: ${githubVM.userProfile?.location ?? "null"}"),
                  Text(
                      "followers: ${githubVM.userProfile?.followers ?? "null"}"),
                  Text(
                      "following: ${githubVM.userProfile?.following ?? "null"}"),
                  Text(
                      "public repos: ${githubVM.userProfile?.publicRepos ?? "null"}"),
                  Text(
                      "public gists: ${githubVM.userProfile?.publicGists ?? "null"}"),
                  Text(
                      "created at: ${DateTime.parse(githubVM.userProfile?.createdAt ?? "").toLocal()}"),
                  Text(
                      "updated at: ${DateTime.parse(githubVM.userProfile?.updatedAt ?? "").toLocal()}"),

                  FilledButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const RepositoryView()));
                        githubVM.getRepo();
                      },
                      child: const Text("View Repos"))
                  // child:
                  // Image.network(githubVM.userProfile?.avatarUrl ?? ""),
                ],
              );
            },
          ),
        ),
      )),
    );
  }
}
