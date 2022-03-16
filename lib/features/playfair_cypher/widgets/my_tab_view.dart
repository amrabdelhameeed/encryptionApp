import 'package:flutter/material.dart';
import 'package:flutter_advanced_segment/flutter_advanced_segment.dart';

class CustomTabView extends StatelessWidget {
  const CustomTabView({Key? key, this.segments, this.controller})
      : super(key: key);
  final Map<String, String>? segments;
  final ValueNotifier<String>? controller;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AdvancedSegment(controller: controller, segments: segments!),
    );
  }
}
