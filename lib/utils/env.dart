import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'GITHUB_CLIENT_ID', obfuscate: true)
  static String clientId = _Env.clientId;

  @EnviedField(varName: 'GITHUB_CLIENT_SECRET', obfuscate: true)
  static String clientSecret = _Env.clientSecret;
}
