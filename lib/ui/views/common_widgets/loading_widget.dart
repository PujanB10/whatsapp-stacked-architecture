import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_stacked_architecture/ui/common/app_colors.dart';

/// A widget to display a centered loading spinner in the application.
class LoadingWidget extends StatelessWidget {
  /// The color of the loading spinner.
  final Color loadingWidgetColor;

  /// Creates a [LoadingWidget] with an optional spinner color.
  /// If no color is provided, it defaults to [AppColor.primary].
  const LoadingWidget({this.loadingWidgetColor = AppColor.primary, super.key});

  @override
  Widget build(BuildContext context) {
    // Returns a centered spinner with specified height and width.
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
