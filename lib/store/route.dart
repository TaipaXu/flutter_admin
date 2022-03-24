import 'package:flutter/material.dart';
import '/models/effectiveView.dart' as model;

class Route with ChangeNotifier {
  model.EffectiveView? _currentRoute;
  final Set<model.EffectiveView> _visitedRoutes = {};

  Route();

  model.EffectiveView? get currentRoute => _currentRoute;
  Set<model.EffectiveView> get visitedRoutes => _visitedRoutes;

  void setCurrentRoute(model.EffectiveView view) {
    _currentRoute = view;
    notifyListeners();
  }

  void addVisitedRoute(model.EffectiveView view) {
    _visitedRoutes.add(view);
    notifyListeners();
    // if (!_visitedRoutes.contains(view)) {
    // }
    print(_visitedRoutes);
  }

  void removeVisitenRoute(model.EffectiveView view) {
    _visitedRoutes.remove(view);
    notifyListeners();
    print(_visitedRoutes);
  }

  void removeOtherRoutes(model.EffectiveView view) {
    _visitedRoutes.removeWhere((element) => element != view);
  }

  void removeAllRoutes() {
    _currentRoute = null;
    _visitedRoutes.clear();
  }
}

final Route route = Route();
