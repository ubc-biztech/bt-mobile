import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'landing_presenter.dart';
import 'landing_view.dart';

class Landing extends StatefulWidget {
  const Landing(this.presenter, {Key key}) : super(key: key);

  final LandingPresenter presenter;

  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends LandingView {
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
