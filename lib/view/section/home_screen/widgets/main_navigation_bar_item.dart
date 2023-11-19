import 'package:flutter/material.dart';

class MainNavigationBarItem extends BottomNavigationBarItem {
  MainNavigationBarItem({
    required this.icon,
    required this.activeIcon,
    this.label,
    this.sound,
    required this.routeIndex,
  }) : super(icon: icon, activeIcon: activeIcon, label: label);
  final int routeIndex;
  final Widget icon;
  final Widget activeIcon;
  final String? label;
  final String? sound;
}
