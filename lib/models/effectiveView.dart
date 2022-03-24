import 'package:flutter/material.dart';
import './baseView.dart';

class EffectiveView extends BaseView {
  String? permission;
  bool hide;

  EffectiveView({
    required String name,
    required String title,
    Widget? icon,
    this.permission,
    this.hide = false,
  }) : super(name: name, title: title, icon: icon);

  @override
  bool operator ==(covariant EffectiveView other) {
    return name == other.name;
  }

  @override
  int get hashCode => name.hashCode;
}
