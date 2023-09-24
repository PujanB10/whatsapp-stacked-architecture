import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:whatsapp_stacked_architecture/ui/views/home/widgets/home_view_app_bar_widget.dart';
import 'package:whatsapp_stacked_architecture/ui/views/home/widgets/user_list_view_widget.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: const HomeViewAppBarWidget(),
        body: UsersListViewWidget(
          homeViewModel: viewModel,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.message),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();

  IconButton buildIconButton(Icon iconName) {
    return IconButton(
      icon: iconName,
      onPressed: () {},
    );
  }
}
