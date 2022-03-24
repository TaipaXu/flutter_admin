import 'package:flutter/material.dart';
import './effectiveView.dart';

class InnerView extends EffectiveView {
  Widget page;

  InnerView({
    required String name,
    required String title,
    Widget? icon,
    String? permission,
    bool hide = false,
    required this.page,
  }) : super(
            name: name,
            title: title,
            icon: icon,
            permission: permission,
            hide: hide);
}
