import 'package:bt_mobile/base/model.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class LandingModel extends Model {
  int pageIndex = 0;
  List<Widget> pages = [];
  List<Tuple2<Widget, String>> iconAndTitles = [];

  Widget get currentPage => pages[pageIndex];
}
