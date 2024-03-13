import 'package:double_s/common/services/storage/base_key_value_storage_service.dart';
import 'package:double_s/common/services/storage/shared_prefs_storage_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
//
import 'package:double_s/common/services/locale_service.dart';
import 'package:double_s/ui/dialogs/confirmation/confirmation_dialog.dart';
import 'package:double_s/ui/dialogs/confirmation/delete_confirmation_dialog.dart';
import 'package:double_s/ui/dialogs/error/error_dialog.dart';
import 'package:double_s/ui/dialogs/success/success_dialog.dart';
//
import 'package:double_s/ui/views/home/home_view.dart';
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
    MaterialRoute(page: HomeView, initial: true),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: RouterService),
    InitializableSingleton(
      classType: SharedPrefsStorageService,
      asType: BaseKeyValueStorageService,
    ),
    InitializableSingleton(classType: LocaleService),
// @stacked-service
  ],
)
class App {}

extension ServicesExtension on StackedLocator {
  RouterService get routerService => get<RouterService>();
  DialogService get dialogService => get();
  LocaleService get localeService => get();
}

extension NavExtension on RouterService {
  void popAllAndPush(PageRouteInfo<dynamic> route) {
    router.pushAndPopUntil(route, predicate: (_) => false);
  }
}
