import 'package:clipboard/clipboard.dart';
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
      decoration: BoxDecoration(
        color: Colors.blue,
        image: DecorationImage(
            colorFilter: new ColorFilter.mode(Colors.blue.withOpacity(0.3), BlendMode.dstATop),
            image: AssetImage('assets/images/app_icon.png'),
            fit: BoxFit.scaleDown),
      ),
      child: Center(
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildItemButton('Краткое изложение', '/contents'),
                  _buildItemButton('Имена', '/names'),
                  _buildItemButton('Разъяснение имён', '/tafsirs'),
                  _buildItemButton('Викторина', '/quiz'),
                  _buildItemButton('Карточки', '/cards'),
                  TextButton.icon(
                    label: Text(
                      'Поддержать проект',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    icon: Icon(
                      CupertinoIcons.bitcoin_circle,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => new AlertDialog(
                          title: Text(
                            'Поддержать проект!',
                            style: TextStyle(color: Colors.blue),
                          ),
                          content: Flexible(
                            flex: 1,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Card(
                                  elevation: 1,
                                  shadowColor: Colors.blue,
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SelectableText(
                                          'Bitcoin:\n\n13B9fMAxXFCSkLnkHFNrA2D2xAZtyMaWxy',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        TextButton.icon(
                                          icon: Icon(
                                            CupertinoIcons.bitcoin_circle,
                                            color: Colors.blue,
                                          ),
                                          label: Text(
                                            'Скопировать адрес',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          onPressed: () {
                                            FlutterClipboard.copy(
                                                '13B9fMAxXFCSkLnkHFNrA2D2xAZtyMaWxy');
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                backgroundColor: Colors.blue,
                                                content: Text(
                                                  'Адрес скопирован',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                duration:
                                                    Duration(milliseconds: 500),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  elevation: 1,
                                  shadowColor: Colors.red,
                                  child: Flexible(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Column(
                                        children: [
                                          SelectableText(
                                            'Monero:\n\n87zyaJCihgg2r8mSbXKE1uj4iqPp8hqQkWMdr2SbBVmGchjVNACEDDtEV1tB79cK1q2bC8h8Sy3BMVQLfWCSfyBjLjqkJB7',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          TextButton.icon(
                                            icon: Icon(
                                              CupertinoIcons
                                                  .money_dollar_circle,
                                              color: Colors.red,
                                            ),
                                            label: Text(
                                              'Скопировать адрес',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.red),
                                            ),
                                            onPressed: () {
                                              FlutterClipboard.copy(
                                                  '87zyaJCihgg2r8mSbXKE1uj4iqPp8hqQkWMdr2SbBVmGchjVNACEDDtEV1tB79cK1q2bC8h8Sy3BMVQLfWCSfyBjLjqkJB7');
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  backgroundColor: Colors.red,
                                                  content: Text(
                                                    'Адрес скопирован',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                ),
                                              );
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          actions: [
                            MaterialButton(
                              child: Text(
                                'Закрыть',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 18),
                              ),
                              onPressed: () {
                                Navigator.of(context, rootNavigator: true)
                                    .pop();
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
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
