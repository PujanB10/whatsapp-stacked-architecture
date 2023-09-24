import 'package:flutter/material.dart';
import 'package:whatsapp_stacked_architecture/ui/views/chat_page/chat_page_viewmodel.dart';

class ChatPageAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const ChatPageAppBarWidget(
      {super.key,
      required this.imageUrl,
      required this.username,
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
          Text(username)
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
