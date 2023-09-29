import 'package:flutter/material.dart';
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
        ListView.builder(
          itemCount: homeViewModel.dummy.length,
          itemBuilder: ((BuildContext context, int index) => Column(
                children: [
                  const Divider(
                    height: 10,
                    color: Colors.white,
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(
                          homeViewModel.userInfo(index)["imageURL"]!),
                    ),
                    onTap: () {
                      homeViewModel.callChatPage(
                        homeViewModel.userInfo(index)["userName"]!,
                        homeViewModel.userInfo(index)["imageURL"]!,
                      );
                    },
                    title: Row(
                      children: <Widget>[
                        //create UIhelper and implement
                        Text(
                          homeViewModel.userInfo(index)["userName"]!,
                          style: Theme.of(context).textTheme.titleMedium,
                        )
                      ],
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          homeViewModel.userInfo(index)["userMessages"]!,
                        ),
                        Text(homeViewModel.userInfo(index)["time"]!)
                      ],
                    ),
                  ),
                ],
              )),
        ),
        const Icon(Icons.groups_sharp),
        const Icon(Icons.groups_sharp)
      ],
    );
  }
}
