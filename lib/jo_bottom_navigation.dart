library jo_bottom_navigation;

import 'package:flutter/material.dart';
import 'jo_navigation_item.dart';

String? joNavigationCurrentRoute;

class JONavigation extends StatefulWidget {
  const JONavigation({
    Key? key,
    this.rtl = true,
    required this.items,
  }) : super(key: key);
  final bool rtl;
  final List<JONavigationItem> items;

  @override
  State<JONavigation> createState() => _JONavigationState();
}

class _JONavigationState extends State<JONavigation> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: widget.rtl ? TextDirection.rtl : TextDirection.ltr,
      child: Container(
        height: 70.0,
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ]),
        child: ListView(
          padding: const EdgeInsets.all(0.0),
          scrollDirection: Axis.horizontal,
          children: widget.items,
        ),
      ),
    );
  }
}
