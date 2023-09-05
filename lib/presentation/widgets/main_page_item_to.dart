import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_names_of/domain/models/arguments/main_args.dart';

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
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, routeName, arguments: MainArgs(null));
        },
        tileColor: evenItemColor,
        splashColor: oddItemColor,
        visualDensity: const VisualDensity(vertical: -4),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        trailing: const Icon(CupertinoIcons.forward),
      ),
    );
  }
}
