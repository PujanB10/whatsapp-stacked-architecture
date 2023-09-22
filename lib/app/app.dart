import 'package:whatsapp_stacked_architecture/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:whatsapp_stacked_architecture/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:whatsapp_stacked_architecture/ui/views/home/home_view.dart';
import 'package:whatsapp_stacked_architecture/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:whatsapp_stacked_architecture/ui/views/chat_page/chat_page_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: ChatPageView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
