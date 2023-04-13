import 'package:flutter/material.dart';
import '../screens/screens.dart';

class SkillWidget extends StatelessWidget {
  final String title;
  final String imagePath;
  final Color shadowColor;
  final bool isActive;
  final SkillType skillType;
  final Function() onTap;
  static const double radius = 12;

  const SkillWidget({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.shadowColor,
    required this.isActive,
    required this.skillType,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return InkWell(
      borderRadius: BorderRadius.circular(radius),
      onTap: onTap,
      child: Container(
        height: 110,
        width: 110,
        decoration: isActive
            ? BoxDecoration(
                color: themeData.dividerColor,
                borderRadius: BorderRadius.circular(radius),
              )
            : null,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            decoration: isActive
                ? BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: shadowColor.withOpacity(0.5), blurRadius: 20)
                  ])
                : null,
            child: Image.asset(
              imagePath,
              width: 40,
              height: 40,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(title)
        ]),
      ),
    );
  }
}
