import 'package:stacked/stacked.dart';
import 'package:whatsapp_stacked_architecture/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:whatsapp_stacked_architecture/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:whatsapp_stacked_architecture/ui/views/home/home_view.dart';
import 'package:whatsapp_stacked_architecture/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:whatsapp_stacked_architecture/ui/views/chat_page/chat_page_view.dart';
import 'package:whatsapp_stacked_architecture/ui/views/login/login_view.dart';
import 'package:whatsapp_stacked_architecture/ui/views/register/register_view.dart';
import 'package:whatsapp_stacked_architecture/services/create_new_user_service.dart';
import 'package:whatsapp_stacked_architecture/services/login_service_service.dart';
import 'package:whatsapp_stacked_architecture/ui/dialogs/should_exit/should_exit_dialog.dart';
import 'package:whatsapp_stacked_architecture/services/fetch_user_list_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    CustomRoute(
      page: ChatPageView,
    ),
    CustomRoute(page: LoginView),
    CustomRoute(page: RegisterView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: CreateNewUserService),
    LazySingleton(classType: LoginServiceService),
    LazySingleton(classType: FetchUserListService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    StackedDialog(classType: ShouldExitDialog),
// @stacked-dialog
  ],
)
class App {}
