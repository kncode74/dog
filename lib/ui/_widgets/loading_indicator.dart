import 'package:cm_mobile/ui/_theme/app_theme.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final Alignment alignment;

  const LoadingIndicator({
    Key? key,
    this.alignment = Alignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(ThemeData().primary()),
      ),
    );
  }
}
