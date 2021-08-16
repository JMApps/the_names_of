import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:the_names_of/pages/drawer_menu_page.dart';
import 'package:the_names_of/pages/main_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  var _zoomDrawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ZoomDrawer(
        controller: _zoomDrawerController,
        style: DrawerStyle.DefaultStyle,
        menuScreen: DrawerMenuPage(),
        mainScreen: MainPage(_zoomDrawerController),
        borderRadius: 24,
        showShadow: true,
        angle: 0,
        backgroundColor: Colors.grey[300]!,
        slideWidth: MediaQuery.of(context).size.width * 0.50,
        openCurve: Curves.fastOutSlowIn,
        closeCurve: Curves.bounceIn,
      ),
    );
  }
}
