import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_web_pet/events_view.dart';
import 'package:googleapis/sheets/v4.dart';
import 'home_screen.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  Widget pageLayout() {
    return ListView(
      physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      scrollDirection: Axis.vertical,
      shrinkWrap: false,
      children: <Widget>[
        Container(child: Image.asset('assets/images/guru.jpeg')),
        Container(
          color: Colors.blueGrey,
          child: Center(child: Text("chan")),
        ),
        Wrap(
          spacing: 50,
          runSpacing: 50,
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: <Widget>[
            EventsView(),
            Container(
              color: Colors.red,
              width: 650,
              height: 500,
            ),
            Container(
              color: Colors.red,
              width: 500,
              height: 500,
            ),
            Container(
              color: Colors.red,
              width: 500,
              height: 500,
            ),
            Container(
              color: Colors.red,
              width: 500,
              height: 500,
            ),
            Container(
              color: Colors.red,
              width: 500,
              height: 500,
            ),
            Container(
              color: Colors.red,
              width: 500,
              height: 500,
            ),
            Container(
              color: Colors.red,
              width: 500,
              height: 500,
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final _currentPage = context.select<MenuProvider, int>((provider) => provider.currentPage);

    return LayoutBuilder(builder: (context, constraints) {
      return pageLayout();
    });
  }
}

// Text("${tr("current")}: ${HomeScreen.mainMenu[_currentPage].title}"),
