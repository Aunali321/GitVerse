import 'package:gitverse/app/app.locator.dart';
import 'package:gitverse/app/app.router.dart';
import 'package:gitverse/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final _authenticationService = locator<AuthenticationService>();
  final _navigationService = locator<NavigationService>();

  Future<void> login() async {
    await _authenticationService.login();
    await getRepos();
    await _navigationService.replaceWithHomeView();
  }

  Future<void> getRepos() async {
    await _authenticationService.getRepos();
  }
}
