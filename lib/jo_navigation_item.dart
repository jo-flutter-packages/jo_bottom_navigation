import 'package:flutter/material.dart';
import 'package:jo_bottom_navigation/jo_bottom_navigation.dart';

class JOBottomNavigationItem extends StatelessWidget {
  const JOBottomNavigationItem({
    Key? key,
    required this.icon,
    required this.route,
    required this.callback,
    this.visible,
    this.enable,
  }) : super(key: key);
  final IconData icon;
  final String route;
  final Function() callback;
  final bool? visible;
  final bool? enable;

  @override
  Widget build(BuildContext context) {
    return visible == true
        ? Container(
            height: 60.0,
            width: 65.0,
            decoration: BoxDecoration(
              color: joNavigationCurrentRoute != route
                  ? null
                  : Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(20.0),
            ),
            margin: const EdgeInsets.all(10.0),
            child: IconButton(
              enableFeedback: enable,
              padding: const EdgeInsets.all(0.0),
              icon: Icon(
                icon,
                color: joNavigationCurrentRoute == route
                    ? null
                    : visible == false || enable == false
                        ? Theme.of(context).disabledColor
                        : Theme.of(context).cardColor,
              ),
              iconSize: 30.0,
              onPressed: visible == false || enable == false
                  ? null
                  : () {
                      joNavigationCurrentRoute = route;
                      callback.call();
                      Navigator.of(context).pushNamed(route);
                    },
            ),
          )
        : const SizedBox();
  }
}
