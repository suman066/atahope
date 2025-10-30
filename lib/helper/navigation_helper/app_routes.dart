import 'package:flutter/material.dart';
import 'package:atahope/view_screen/splash_screen.dart';
import 'package:atahope/view_screen/welcome_screen.dart';
import 'package:atahope/view_screen/dinne_ing/dinne_ing_page.dart';

class AppRoutes {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static BuildContext? get ctx => navigatorKey.currentContext;

  static const String splash = '/';
  static const String welcome = '/welcome';
  static const String dineIn = '/dineIn';

}
class AppRouterDelegate extends RouterDelegate<RouteSettings>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RouteSettings> {
  @override
  final GlobalKey<NavigatorState> navigatorKey = AppRoutes.navigatorKey;

  final List<Page> _pages = [
    const MaterialPage(child: SplashScreenPage(), name: AppRoutes.splash),
  ];

  @override
  RouteSettings? get currentConfiguration =>
      _pages.isNotEmpty ? RouteSettings(name: _pages.last.name) : null;

  // 🟢 PUSH
  void push(String routeName) {
    _pages.add(MaterialPage(child: _buildPageFor(routeName), name: routeName));
    notifyListeners();
  }

  // 🟠 PUSH REPLACEMENT
  void pushReplacement(String routeName) {
    if (_pages.isNotEmpty) _pages.removeLast();
    _pages.add(MaterialPage(child: _buildPageFor(routeName), name: routeName));
    notifyListeners();
  }

  // 🔴 PUSH AND REMOVE UNTIL
  void pushAndRemoveUntil(String routeName, bool Function(RouteSettings) predicate) {
    _pages.removeWhere((page) {
      final settings = RouteSettings(name: page.name);
      return !predicate(settings);
    });
    _pages.add(MaterialPage(child: _buildPageFor(routeName), name: routeName));
    notifyListeners();
  }

  // 🔵 POP
  void pop() {
    if (_pages.length > 1) {
      _pages.removeLast();
      notifyListeners();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: List.of(_pages),
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        pop();
        return true;
      },
    );
  }

  Widget _buildPageFor(String? routeName) {
    switch (routeName) {
      case AppRoutes.welcome:
        return const WelcomeScreen();
      case AppRoutes.dineIn:
        return const DinneIngPage();
      case AppRoutes.splash:
      default:
        return const SplashScreenPage();
    }
  }

  @override
  Future<void> setNewRoutePath(RouteSettings configuration) async {
    pushReplacement(configuration.name ?? AppRoutes.splash);
  }
}


class AppRouteInformationParser extends RouteInformationParser<RouteSettings> {
  @override
  Future<RouteSettings> parseRouteInformation(RouteInformation routeInformation) async {
    final uri = routeInformation.uri ?? Uri.parse('/');

    if (uri.pathSegments.isEmpty) {
      return const RouteSettings(name: AppRoutes.splash);
    }

    final path = '/${uri.pathSegments.first}';
    return RouteSettings(name: path);
  }


  @override
  RouteInformation? restoreRouteInformation(RouteSettings configuration) {
    final name = configuration.name ?? '/';
    return RouteInformation(uri: Uri.parse(name));
  }

}