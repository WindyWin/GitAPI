import 'package:git_api/config/github_api.dart';
import 'package:git_api/data/models/user_profile.dart';
import 'package:git_api/data/service/base_client.dart';

class UserProfileService {
  String baseURL = "$GITHUB_API_URL/user";
  BaseClient client = BaseClient();

  Future<UserProfile?> getUserProfile() {
    return client.get(baseURL, "").then((response) {
      if (response.statusCode == 200) {
        return UserProfile.fromJson(response.body);
      } else {
        return null;
      }
    });
  }
}
