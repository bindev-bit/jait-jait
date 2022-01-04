import 'package:flutter/material.dart';
import 'package:jait_jait/components/const/color.dart';

class CustomIconButton extends StatelessWidget {
  final String tooltip;
  final VoidCallback? onTap;
  final Widget icon;
  final double? padding;
  const CustomIconButton({
    required this.tooltip,
    this.onTap,
    this.padding = 5,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding!),
      child: Material(
        type: MaterialType.transparency,
        child: Tooltip(
          message: tooltip,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(6),
            splashColor: primaryColor.withOpacity(.1),
            highlightColor: primaryColor.withOpacity(.2),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: secondaryColor.withOpacity(.4),
              ),
              padding: const EdgeInsets.all(10),
              child: icon,
            ),
          ),
        ),
      ),
    );
  }
}
