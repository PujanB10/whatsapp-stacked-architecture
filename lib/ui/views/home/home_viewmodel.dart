import 'package:whatsapp_stacked_architecture/app/app.locator.dart';
import 'package:whatsapp_stacked_architecture/datamodels/user_model.dart';
import 'package:whatsapp_stacked_architecture/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:whatsapp_stacked_architecture/services/fetch_user_list_service.dart';

class HomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _fetchUserService = locator<FetchUserListService>();

  /// Method to navigate to ChatPage.
  void navigateToChatPage(
      {required String userName,
      required String imageUrl,
      required String receiverUserID}) {
    _navigationService.navigateToChatPageView(
        transition: TransitionsBuilders.slideLeft,
        username: userName,
        imageUrl: imageUrl,
        receiverUserId: receiverUserID);
  }

  /// Function that displays an exit dialog where if
  /// pressed "Ok" returns true to the view and if pressed
  ///  "Cancel" returns false to the view.
  Future<bool> isExitDialog() async {
    // Display dialog from the dialog service.
    var res = await _dialogService.showConfirmationDialog(
        title: "Do you want to exit?");
    return (res!.confirmed);
  }

  /// Method to call the service that fetches the list
  /// of users from the database.
  Stream<List<Users>> fetchUserList() {
    return _fetchUserService.fetchUserList();
  }
}
