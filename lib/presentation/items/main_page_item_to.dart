import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPageItemTo extends StatelessWidget {
  const MainPageItemTo({
    super.key,
    required this.routeName,
    required this.title,
  });

  final String routeName;
  final String title;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final Color oddItemColor = appColors.primary.withAlpha(75);
    final Color evenItemColor = appColors.inversePrimary;
    return Container(
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
        color: oddItemColor,
      ),
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(
            context,
            routeName,
            arguments: 0,
          );
        },
        splashColor: evenItemColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        visualDensity: const VisualDensity(vertical: -4),
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 20.0,
          ),
        ),
        trailing: const Icon(CupertinoIcons.forward),
      ),
    );
  }
}
