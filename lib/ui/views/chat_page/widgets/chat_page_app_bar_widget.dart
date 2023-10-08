import 'package:flutter/material.dart';
import 'package:whatsapp_stacked_architecture/ui/views/chat_page/chat_page_viewmodel.dart';
import 'package:whatsapp_stacked_architecture/ui/views/common_widgets/app_bar_title_text_widget.dart';

/// An appbar widget that resides on top of the chat page.
class ChatPageAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  /// Creates a [ChatPageAppBarWidget].
  ///
  /// [imageUrl],[username] and [viewModel] must not be null.
  const ChatPageAppBarWidget(
      {super.key,

      /// [imageUrl] is the url of the image of user whose chat message has been opened.
      required this.imageUrl,

      /// [username] is the username of user whose chat message has been opened.
      required this.username,

      /// [viewModel] is the instance of the view model of chat page.
      required this.viewModel});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  final String imageUrl;
  final String username;
  final ChatPageViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: BackButton(onPressed: () {
        viewModel.navigateBack();
      }),
      title: Row(
        children: <Widget>[
          CircleAvatar(backgroundImage: AssetImage(imageUrl)),
          const Padding(
            padding: EdgeInsets.all(8),
          ),
          AppBarTitleTextWidget(
            text: username,
          )
        ],
      ),
      actions: [
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.video_call_rounded)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
      ],
    );
  }
}
