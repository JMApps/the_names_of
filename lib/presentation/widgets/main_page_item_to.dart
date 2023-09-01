import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_names_of/application/strings/app_strings.dart';

class MainPageItemTo extends StatelessWidget {
  const MainPageItemTo({
    super.key,
    required this.routeName,
    required this.textColor,
  });

  final String routeName;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, routeName);
        },
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        title: Text(
          AppStrings.jumpToContent,
          style: TextStyle(
            fontFamily: 'Gilroy',
            color: textColor,
          ),
        ),
        trailing: const Icon(CupertinoIcons.forward),
      ),
    );
  }
}
