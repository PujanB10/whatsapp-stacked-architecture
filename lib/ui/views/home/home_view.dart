import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:whatsapp_stacked_architecture/ui/common/ui_helpers.dart';

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
        appBar: AppBar(
          title: const Text("WhatsApp"),
          actions: [
            buildIconButton(const Icon(Icons.camera_alt_outlined)),
            buildIconButton(const Icon(Icons.search)),
            buildIconButton(const Icon(Icons.more_vert))
          ],
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.groups),
            ),
            Tab(
              text: "Chat",
            ),
            Tab(
              text: "Status",
            ),
            Tab(
              text: "Calls",
            ),
          ]),
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
