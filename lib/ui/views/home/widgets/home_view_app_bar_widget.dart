import 'package:flutter/material.dart';
import 'package:whatsapp_stacked_architecture/ui/views/common_widgets/app_bar_title_text_widget.dart';
import 'package:whatsapp_stacked_architecture/ui/views/common_widgets/body_text_widget.dart';
import 'package:whatsapp_stacked_architecture/ui/views/home/widgets/icon_button_widget.dart';

/// A appbar for displaying information and other functionalities.
class HomeViewAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  /// Creates a [HomeViewAppBarWidget] widget.
  ///
  /// Takes no arguments.
  ///
  /// Creates a app bar with "WhatsApp" as its title.
  /// Also creates a tab bar with options as Groups, Chats,
  /// Status, Calls.
  const HomeViewAppBarWidget({super.key});

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight + kTextTabBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const AppBarTitleTextWidget(
        text: 'WhatsApp',
        // style: Theme.of(context).textTheme.titleSmall,
      ),
      actions: <Widget>[
        IconButtonWidget(
            onPressed: () {}, iconName: const Icon(Icons.camera_alt_outlined)),
        IconButtonWidget(
            onPressed: () {}, iconName: const Icon(Icons.search_outlined)),
        PopupMenuButton(
            itemBuilder: (context) =>
                [const PopupMenuItem(child: BodyTextWidget(text: "Sign Out"))])
      ],

      /// Create tab bar with four tabs.
      bottom: const TabBar(
        tabs: <Widget>[
          Tab(
            icon: Icon(Icons.groups),
          ),
          Tab(
            text: 'Chats',
          ),
          Tab(text: 'Status'),
          Tab(
            text: 'Calls',
          ),
        ],
      ),
    );
  }
}
