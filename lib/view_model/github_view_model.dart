import 'package:flutter/material.dart';
import 'package:git_api/data/models/repository.dart';
import 'package:git_api/data/models/userProfile.dart';
import 'package:git_api/data/service/github_service.dart';

class GithubVM with ChangeNotifier {
  final GithubService githubService = GithubService();
  bool loading = false;
  String _repoKeyword = "";
  String get repoKeyword => _repoKeyword;
  set repoKeyword(String value) {
    _repoKeyword = value;
    notifyListeners();
  }

  UserProfile? _userProfile = UserProfile();
  UserProfile? get userProfile => _userProfile;
  set userProfile(UserProfile? value) {
    _userProfile = value;
    notifyListeners();
  }

  List<Repository> _listRepo = [];
  List<Repository> get listRepo {
    if (_repoKeyword.isEmpty) {
      return _listRepo;
    }

    return _listRepo
        .where(
            (e) => e.name!.toLowerCase().contains(_repoKeyword.toLowerCase()))
        .toList();
  }

  set listRepo(List<Repository> value) {
    _listRepo = value;
    notifyListeners();
  }

  Future getRepo() async {
    loading = true;
    notifyListeners();
    await githubService.getUserRepositories().then((value) {
      if (value != null) {
        listRepo = value;
      }
    });
    loading = false;
    notifyListeners();
  }

  Future<bool> createRepository(
      name, description, homepage, private, isTemplate) async {
    loading = true;
    notifyListeners();
    final response = await githubService.createRepo(
        name, description, homepage, private, isTemplate);
    loading = false;
    notifyListeners();
    return response;
  }
}
