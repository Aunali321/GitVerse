import 'package:gitverse/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:gitverse/app/app.locator.dart';
import 'package:gitverse/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authenticationService = locator<AuthenticationService>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 3));

    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic

    // check if user token is valid and navigate to home page

    if (await _authenticationService.oAuth2Helper.getTokenFromStorage() !=
        null) {
      _navigationService.replaceWith(Routes.homeView);
    } else {
      _navigationService.replaceWith(Routes.loginView);
    }
  }
}
