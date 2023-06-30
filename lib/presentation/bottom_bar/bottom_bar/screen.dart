import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pandabar/pandabar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String page = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: PandaBar(
        buttonData: [
          PandaBarButtonData(
              id: '0',
              icon: Icons.dashboard,
              title: 'Home'
          ),
          PandaBarButtonData(
              id: '1',
              icon: Icons.search,
              title: 'Search'
          ),
          PandaBarButtonData(
              id: '2',
              icon: Icons.bookmark_border,
              title: 'Saved'
          ),
          PandaBarButtonData(
              id: '3',
              icon: Icons.person,
              title: 'Profile'
          ),
        ],
        onChange: (id) {
          setState(() {
            page = id;
          });
        },
        onFabButtonPressed: () {
          showCupertinoDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  content: const Text('Scan Qr code!'),
                  actions: <Widget>[
                    CupertinoDialogAction(
                      isDestructiveAction: true,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Close'),
                    )
                  ],
                );
              }
          );
        },
        fabIcon: const Icon(Icons.qr_code_scanner),
      ),
      body: Builder(
        builder: (context) {

          switch (page) {
            case '0':
              return Container(color: Colors.white);
            case '1':
              return Container(color: Colors.blue.shade900);
            case '2':
              return Container(color: Colors.red.shade900);
            case '3':
              return Container(color: Colors.yellow.shade700);
            default:
              return Container();

          }

        },
      ),
    );
  }
}