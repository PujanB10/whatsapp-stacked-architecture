import 'package:whatsapp_stacked_architecture/app/app.locator.dart';
import 'package:whatsapp_stacked_architecture/datamodels/user_model.dart';
import 'package:whatsapp_stacked_architecture/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:whatsapp_stacked_architecture/services/fetch_user_list_service.dart';

class HomeViewModel extends BaseViewModel {
  List<Users> dummy = [];
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _fetchUserService = locator<FetchUserListService>();

  void callChatPage(String userName, String imageUrl) {
    _navigationService.navigateToChatPageView(
        transition: TransitionsBuilders.slideLeft,
        username: userName,
        imageUrl: imageUrl);
  }

  Future<bool> isExitDialog() async {
    var res = await _dialogService.showConfirmationDialog(
        title: "Do you want to exit?");
    return (res!.confirmed);
  }

  Stream<List<Users>> fetchUserList() {
    return _fetchUserService.fetchUserList();
  }
}
