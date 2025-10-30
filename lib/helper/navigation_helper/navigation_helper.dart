import 'package:flutter/material.dart';
import 'package:atahope/helper/navigation_helper/app_routes.dart';

class NavigationHelper {
  static AppRouterDelegate get _delegate =>
      Router.of(AppRoutes.ctx!).routerDelegate as AppRouterDelegate;

  /// Pushes a new page on top of the stack
  static void push(String routeName) {
    _delegate.push(routeName);
  }

  /// Replaces the current top page with a new one
  static void pushReplacement(String routeName) {
    _delegate.pushReplacement(routeName);
  }

  /// Pushes a new route and removes until predicate returns true
  static void pushAndRemoveUntil(String routeName, bool Function(RouteSettings) predicate) {
    _delegate.pushAndRemoveUntil(routeName, predicate);
  }

  /// Pops the current page
  static void pop() {
    _delegate.pop();
  }
}
