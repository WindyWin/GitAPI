import 'package:flutter/material.dart';
import 'package:git_api/data/service/user_profile_service.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String _token = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter your token',
              ),
              onChanged: (value) {
                setState(() {
                  _token = value;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.pushNamed(context, '/home');
                UserProfileService userProfileService = UserProfileService();
                userProfileService.client.setHeaderAuth(_token);
                userProfileService.getUserProfile().then((value) {
                  if (value != null) {
                    Navigator.pushNamed(context, '/home');
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
          ],
        ),
      ),
    );
  }
}
