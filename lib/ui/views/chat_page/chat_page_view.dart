import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:whatsapp_stacked_architecture/ui/common/app_colors.dart';
import 'package:whatsapp_stacked_architecture/ui/views/chat_page/widgets/bottom_nav_bar_widget.dart';
import 'package:whatsapp_stacked_architecture/ui/views/chat_page/widgets/chat_page_app_bar_widget.dart';
import 'package:whatsapp_stacked_architecture/ui/views/chat_page/widgets/message_list_view_widget.dart';
import 'chat_page_viewmodel.dart';

class ChatPageView extends StackedView<ChatPageViewModel> {
  const ChatPageView({Key? key, required this.username, required this.imageUrl})
      : super(key: key);

  final String username;
  final String imageUrl;

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
        userName: username,
        viewModel: viewModel,
      ),
      bottomNavigationBar: BottomNavBar(userName: username),
    );
  }

  @override
  ChatPageViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChatPageViewModel();
}
