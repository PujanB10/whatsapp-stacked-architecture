import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:whatsapp_stacked_architecture/ui/common/app_colors.dart';
import 'package:whatsapp_stacked_architecture/ui/views/chat_page/widgets/bottom_nav_bar_widget.dart';
import 'package:whatsapp_stacked_architecture/ui/views/chat_page/widgets/chat_page_app_bar_widget.dart';
import 'package:whatsapp_stacked_architecture/ui/views/chat_page/widgets/message_list_view_widget.dart';
import 'chat_page_viewmodel.dart';

/// A view for displaying a chat conversation with a specific user.
class ChatPageView extends StackedView<ChatPageViewModel> {
  /// Creates a [ChatPageView] with the given [username], [imageUrl], and [receiverUserId].
  const ChatPageView(
      {Key? key,
      required this.username,
      required this.imageUrl,
      required this.receiverUserId})
      : super(key: key);

  /// The username of the chat recipient.
  final String username;

  /// The URL of the chat recipient's profile image.
  final String imageUrl;

  /// The ID of the user with whom the chat screen is.
  final String receiverUserId;

  @override
  Widget builder(
    BuildContext context,
    ChatPageViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: AppColor.chatBackgroundColor,
      appBar: ChatPageAppBarWidget(
        imageUrl: imageUrl,
        username: username,
        viewModel: viewModel,
      ),
      body: MesssageListViewWidget(
        chatPageViewModel: viewModel,
        receiverUserId: receiverUserId,
      ),
      bottomNavigationBar:
          BottomNavBar(userName: username, viewModel: viewModel),
    );
  }

  @override
  ChatPageViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChatPageViewModel();
}
