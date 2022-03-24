import 'package:flutter/material.dart';

abstract class BaseView {
  late String _name;
  late String _title;
  Widget? _icon;
  BaseView? parent;

  BaseView({required String name, required String title, Widget? icon}) {
    _name = name;
    _title = title;
    _icon = icon;
  }

  @override
  bool operator ==(Object other) =>
      other is BaseView &&
      other.runtimeType == runtimeType &&
      other.name == name;

  @override
  int get hashCode => name.hashCode;

  String get name => _name;
  String get title => _title;
  Widget? get icon => _icon;
}
