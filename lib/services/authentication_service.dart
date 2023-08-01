import 'package:gitverse/utils/env.dart';
import 'package:oauth2_client/access_token_response.dart';
import 'package:oauth2_client/github_oauth2_client.dart';
import 'package:oauth2_client/oauth2_helper.dart';
import 'package:http/http.dart' as http;

class AuthenticationService {
// implement GitHub OAuth2 authentication

// 1. Create a GitHub OAuth2 client

  GitHubOAuth2Client oAuth2Client = GitHubOAuth2Client(
    customUriScheme: 'li.auna.gitverse',
    redirectUri: 'li.auna.gitverse://oauth2redirect',
  );

// 2. Create an OAuth2Helper instance

  late OAuth2Helper oAuth2Helper = OAuth2Helper(
    oAuth2Client,
    grantType: OAuth2Helper.authorizationCode,
    clientId: Env.clientId,
    clientSecret: Env.clientSecret,
    scopes: ['repo', 'read:org'],
  );

// 3. Create a login method
  AccessTokenResponse token = AccessTokenResponse();

  Future<void> login() async {
    try {
      token = await oAuth2Helper.getToken() ?? AccessTokenResponse();
    } catch (e) {
      print(e);
    }
  }

  Future<void> getRepos() async {
    var repos = await http.get(
      Uri.parse(
        "https://api.github.com/user/repos",
      ),
      headers: {
        "Authorization": "Bearer $token",
        "Accept": "application/vnd.github+json",
        "X-GitHub-Api-Version": "2022-11-28"
      },
    );
    print(repos.body);
  }
}
