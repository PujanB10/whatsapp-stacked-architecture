import 'package:whatsapp_stacked_architecture/app/app.locator.dart';
import 'package:whatsapp_stacked_architecture/datamodels/user_model.dart';
import 'package:whatsapp_stacked_architecture/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  final List<Users> _dummy = [
    Users(
        userName: "Pujan",
        messages: "Hey there! How's your day going?",
        time: "2:00 AM",
        imageURL: "lib/ui/assets/icon1.jpeg"),
    Users(
        userName: "Ram",
        messages: "I just tried a new recipe.",
        time: "3:00 AM",
        imageURL: "lib/ui/assets/icon2.png"),
    Users(
        userName: "Shyam",
        messages: "Do you believe in aliens?",
        time: "6:00 AM",
        imageURL: "lib/ui/assets/icon1.jpeg"),
    Users(
        userName: "Gita",
        messages: "I can't wait for the weekend to relax.",
        time: "2:03 PM",
        imageURL: "lib/ui/assets/icon2.png"),
    Users(
        userName: "Sita",
        messages: "Have you ever been on a trip?",
        time: "3:20 AM",
        imageURL: "lib/ui/assets/icon1.jpeg"),
    Users(
        userName: "Rakesh",
        messages: "What's your favorite book of all time?",
        time: "3:00 AM",
        imageURL: "lib/ui/assets/icon2.png"),
    Users(
        userName: "Abishek",
        messages: "Just finished a great workout.",
        time: "6:00 AM",
        imageURL: "lib/ui/assets/icon1.jpeg"),
    Users(
        userName: "Rita",
        messages: "Thinking about starting a new hobby.",
        time: "2:50 PM",
        imageURL: "lib/ui/assets/icon2.png"),
    Users(
        userName: "Nita",
        messages: "The weather today is so unpredictable.",
        time: "2:03 PM",
        imageURL: "lib/ui/assets/icon1.jpeg")
  ];

  List get dummy => _dummy;

  Map<String, String> userInfo(int index) {
    return {
      "userName": _dummy[index].userName!,
      "userMessages": _dummy[index].messages!,
      "imageURL": _dummy[index].imageURL!,
      "time": _dummy[index].time!
    };
  }

  void callChatPage(String userName, String imageUrl) {
    _navigationService.navigateToChatPageView(
        username: userName, imageUrl: imageUrl);
  }
}
