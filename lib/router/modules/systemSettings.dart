import 'package:flutter/material.dart';
import '/models/baseView.dart' as model;
import '/models/groupView.dart' as model;
import '/models/innerView.dart' as model;
import '/pages/auth.dart' as page;

final List<model.BaseView> routes = [
  model.GroupView(
    name: 'systemSettings',
    title: 'System',
    icon: const Icon(
      Icons.settings,
    ),
    children: [
      model.InnerView(
        name: 'auth',
        title: 'Auth',
        page: const page.Auth(),
      ),
    ],
  ),
];
