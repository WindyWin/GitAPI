import 'package:flutter/material.dart';
import 'package:git_api/data/service/github_service.dart';
import 'package:git_api/view_model/github_view_model.dart';
import 'package:git_api/views/home_view.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String _token = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Access Token",
                    border: OutlineInputBorder(),
                  ),
                  initialValue: _token,
                  onChanged: (value) {
                    setState(() {
                      _token = value;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 50,
                width: 180,
                child: ElevatedButton(
                  onPressed: () {
                    GithubService githubService = GithubService();
                    githubService.client.setHeaderAuth(_token);
                    githubService.getUserProfile().then((value) {
                      if (value != null) {
                        context.read<GithubVM>().userProfile = value;
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const HomeView()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Invalid token'),
                          ),
                        );
                      }
                    });
                  },
                  child: const Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
