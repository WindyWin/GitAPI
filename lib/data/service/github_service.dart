import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:git_api/config/github_api.dart';
import 'package:git_api/data/models/repository.dart';
import 'package:git_api/data/models/userProfile.dart';
import 'package:git_api/data/service/base_client.dart';

class GithubService {
  String baseURL = "$GITHUB_API_URL/user";
  BaseClient client = BaseClient();

  Future<UserProfile?> getUserProfile() {
    return client.get(baseURL, "").then((response) {
      if (response.statusCode == 200) {
        debugPrint(response.body);
        return UserProfile.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    });
  }

  Future<List<Repository>?> getUserRepositories() {
    return client.get("$baseURL/repos", "").then((response) {
      if (response.statusCode == 200) {
        List<dynamic> listRepoJson = jsonDecode(response.body);
        return listRepoJson.map((e) => Repository.fromJson(e)).toList();
      } else {
        return null;
      }
    });
  }
// {"name":"Hello-World","description":"This is your first repo!","homepage":"https://github.com","private":false,"is_template":true}

  Future<bool> createRepo(String name, String description, String homepage,
      bool private, bool isTemplate) {
    final body = {
      "name": name,
      "description": description,
      "homepage": homepage,
      "private": private,
      "is_template": isTemplate
    };

    return client.post("$baseURL/repos", "", body: body).then((response) {
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    });
  }
}
