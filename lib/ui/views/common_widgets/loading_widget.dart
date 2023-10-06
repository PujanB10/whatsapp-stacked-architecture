import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_stacked_architecture/ui/common/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  final Color loadingWidgetColor;
  const LoadingWidget({this.loadingWidgetColor = AppColor.primary, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 0.1.sw,
        width: 0.1.sw,
        child: CircularProgressIndicator(
          color: loadingWidgetColor,
        ),
      ),
    );
  }
}
