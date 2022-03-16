// ignore_for_file: non_constant_identifier_names
import 'package:encryption_9_3/core/utils/size_config.dart';
import 'package:encryption_9_3/features/home_layout/widgets/home_layout_view_body.dart';
import 'package:flutter/material.dart';

class HomeLayoutView extends StatefulWidget {
  HomeLayoutView({Key? key}) : super(key: key);
  @override
  State<HomeLayoutView> createState() => _HomeLayoutViewState();
}

class _HomeLayoutViewState extends State<HomeLayoutView> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return HomeLayoutViewBody();
  }
}
