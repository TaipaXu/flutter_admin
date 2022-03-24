import 'package:flutter/material.dart';
import './modules/widgets.dart' as widgets_routes;
import './modules/systemSettings.dart' as system_settings_routes;
import '/models/baseView.dart' as model;
import '/models/innerView.dart' as model;
import '/pages/dashboard.dart' as page;

final model.InnerView dashboard = model.InnerView(
  name: 'dashboard',
  title: 'Dashboard',
  icon: const Icon(
    Icons.desktop_windows,
  ),
  page: const page.Dashboard(),
);

final List<model.BaseView> routes = [
  dashboard,
  ...system_settings_routes.routes,
  ...widgets_routes.routes,
];
