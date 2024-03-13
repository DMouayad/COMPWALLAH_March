import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
//
import 'package:weather_siren/ui/dialogs/confirmation/confirmation_dialog.dart';
import 'package:weather_siren/ui/dialogs/confirmation/delete_confirmation_dialog.dart';
import 'package:weather_siren/ui/dialogs/error/error_dialog.dart';
import 'package:weather_siren/ui/dialogs/success/success_dialog.dart';
import 'package:weather_siren/ui/views/home/home_view.dart';
// @stacked-import
export 'app.locator.dart';
export 'app.router.dart';
export 'app.logger.dart';
export 'app.dialogs.dart';

@StackedApp(
  logger: StackedLogger(),
  dialogs: [
    StackedDialog(classType: ErrorDialog),
    StackedDialog(classType: ConfirmationDialog),
    StackedDialog(classType: DeleteConfirmationDialog),
    StackedDialog(classType: SuccessDialog),
// @stacked-dialog
  ],
  routes: [
    StackedRoute(page: HomeView, initial: true),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: RouterService),
    // LazySingleton(
    //   classType: SecureKeyValueStorageService,
    //   asType: BaseKeyValueStorageService,
    // ),
    // @stacked-service
  ],
)
class App {}

extension ServicesExtension on StackedLocator {
  NavigationService get navigationService => get<NavigationService>();
}

extension NavExtension on RouterService {
  void popAllAndPush(PageRouteInfo<dynamic> route) {
    router.pushAndPopUntil(route, predicate: (_) => false);
  }
}
