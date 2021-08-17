import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerMenuPage extends StatefulWidget {
  const DrawerMenuPage({Key? key}) : super(key: key);

  @override
  _DrawerMenuPageState createState() => _DrawerMenuPageState();
}

class _DrawerMenuPageState extends State<DrawerMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: SingleChildScrollView(
        child: MediaQuery.of(context).orientation == Orientation.portrait
            ? Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 32),
                  IconButton(
                    padding: EdgeInsets.zero,
                    iconSize: 230,
                    onPressed: null,
                    icon: Image.asset('assets/images/app_icon.png'),
                  ),
                  Text(
                    'Толкование прекрасных\nимён Аллаха',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 32),
                  _buildItemButton('Краткое изложение', '/contents'),
                  SizedBox(height: 16),
                  _buildItemButton('Имена', '/names'),
                  SizedBox(height: 16),
                  _buildItemButton('Разъяснение имён', '/tafsirs'),
                  SizedBox(height: 16),
                  _buildItemButton('Викторина', '/quiz'),
                  SizedBox(height: 16),
                  _buildItemButton('Карточки', '/cards'),
                  SizedBox(height: 32),
                ],
              )
            : Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 32),
                      _buildItemButton('Краткое изложение', '/contents'),
                      SizedBox(height: 16),
                      _buildItemButton('Имена', '/names'),
                      SizedBox(height: 16),
                      _buildItemButton('Разъяснение имён', '/tafsirs'),
                      SizedBox(height: 16),
                      _buildItemButton('Викторина', '/quiz'),
                      SizedBox(height: 16),
                      _buildItemButton('Карточки', '/cards'),
                      SizedBox(height: 32),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        iconSize: 250,
                        onPressed: null,
                        icon: Image.asset('assets/images/app_icon.png'),
                      ),
                      Text(
                        'Толкование прекрасных\nимён Аллаха',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildItemButton(String label, String route) {
    return TextButton.icon(
      label: Text(
        label,
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
      icon: Icon(
        CupertinoIcons.decrease_indent,
        color: Colors.white,
      ),
      onPressed: () {
        _buildPushNamed(route);
      },
    );
  }

  _buildPushNamed(String route) {
    Navigator.of(context, rootNavigator: true).pushNamed(route);
  }
}
