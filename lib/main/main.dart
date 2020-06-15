import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'main_presenter.dart';
import 'main_view.dart';

class Main extends StatefulWidget {
  const Main(this.presenter, {Key key}) : super(key: key);

  final MainPresenter presenter;

  @override
  _MainState createState() => _MainState();
}

class _MainState extends MainView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C.darkBackground,
      body: SafeArea(
        child: model.currentPage,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: C.darkBackground,
        selectedItemColor: C.darkColor1,
        unselectedItemColor: C.darkColor2,
        onTap: widget.presenter.onTabTapped,
        currentIndex: model.pageIndex,
        showUnselectedLabels: false,
        items: model.iconAndTitles
            .map((i) => BottomNavigationBarItem(
                  icon: i.item1,
                  title: Text(i.item2),
                ))
            .toList(growable: false),
      ),
    );
  }
}
