import 'package:flutter/material.dart';
import 'package:whatsapp_stacked_architecture/datamodels/user_model.dart';
import 'package:whatsapp_stacked_architecture/gen/assets.gen.dart';
import 'package:whatsapp_stacked_architecture/ui/views/common_widgets/loading_widget.dart';
import 'package:whatsapp_stacked_architecture/ui/views/common_widgets/title_text_widget.dart';
import 'package:whatsapp_stacked_architecture/ui/views/home/home_viewmodel.dart';

/// A message view widget that views list of users with their last messages.
class UsersListViewWidget extends StatelessWidget {
  /// Creates a [UsersListViewWidget].
  ///
  /// Takes the instance of [HomeViewModel] as argument.
  ///
  /// Builds a [ListView] where each elements consists of the
  /// image of the user,username of the user, last sent message of
  /// the user and the time.
  const UsersListViewWidget({required this.homeViewModel, super.key});
  final HomeViewModel homeViewModel;
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        const Icon(Icons.groups_sharp),
        StreamBuilder(
            stream: homeViewModel.fetchUserList(),
            builder: (context, snapshot) {
              List<Users>? listOfUsers;
              if (snapshot.hasData) {
                if (snapshot.data != null) {
                  listOfUsers = snapshot.data;
                  return ListView.builder(
                    itemCount: listOfUsers?.length,
                    itemBuilder: ((context, index) => ListTile(
                          title: TitleTextWidget(
                              text:
                                  "${listOfUsers?[index].firstName} ${listOfUsers?[index].lastName}"),
                          subtitle: Text(listOfUsers?[index].email ?? ""),
                          visualDensity: const VisualDensity(vertical: 4),
                          leading: CircleAvatar(
                            backgroundImage: Assets.images.icon1.provider(),
                          ),
                          onTap: () {
                            homeViewModel.navigateToChatPage(
                                userName: listOfUsers?[index].firstName ??
                                    "Username not found",
                                imageUrl: Assets.images.icon1.path,
                                receiverUserID:
                                    listOfUsers?[index].userId ?? "");
                          },
                        )),
                  );
                } else {
                  return const Center(child: LoadingWidget());
                }
              } else {
                return const Center(child: LoadingWidget());
              }
            }),
        const Icon(Icons.groups_sharp),
        const Icon(Icons.groups_sharp)
      ],
    );
  }
}
