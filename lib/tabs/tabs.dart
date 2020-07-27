import 'package:flutter/material.dart';
import 'package:workball/constants/constants.dart';
import 'package:workball/pages/train_preview.dart';
import 'package:workball/tabs/configuration.dart';
import 'package:workball/tabs/progress.dart';

class Tabs extends StatefulWidget {
  final String position;
  final String name;

  Tabs(this.position, this.name);

  @override
  _TabsState createState() => _TabsState(position, name);
}

class _TabsState extends State<Tabs> {
  String position;
  String name;

  _TabsState(this.position, this.name);

  Widget tapWithBorder(Icon icon, String title) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              left: BorderSide(color: Constants.oddYellow),
              right: BorderSide(color: Constants.oddYellow))),
      child: Tab(
        icon: icon,
        text: title,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Constants.blackBackground,
        body: TabBarView(
          children: <Widget>[
            TrainPreview(position, name),
            Results(),
            Diet(),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Constants.oddYellow),
                  top: BorderSide(color: Constants.oddYellow))),
          child: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.explicit, size: 26.0),
                text: "ENTRENAMIENTO",
              ),
              Tab(
                icon: Icon(Icons.restaurant_menu, size: 26.0),
                text: "PROGRESO",
              ),
              Tab(
                icon: Icon(Icons.insert_chart, size: 26.0),
                text: "CONFIGURACIÓN",
              ),
            ],
            labelPadding: EdgeInsets.all(5.0),
            labelColor: Constants.oddYellow,
            unselectedLabelColor: Colors.white,
            indicatorWeight: 0.01,
          ),
        ),
      ),
    );
  }
}
