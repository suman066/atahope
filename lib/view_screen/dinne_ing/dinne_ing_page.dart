import 'package:atahope/helper/navigation_helper/navigation_helper.dart';
import 'package:atahope/view_screen/dinne_ing/atahope_screen/atahope_screen1.dart';
import 'package:atahope/view_screen/dinne_ing/atahope_screen/s1.dart';
import 'package:atahope/view_screen/dinne_ing/atahope_screen/s2.dart';
import 'package:atahope/view_screen/dinne_ing/atahope_screen/s3.dart';
import 'package:atahope/view_screen/dinne_ing/atahope_screen/s4.dart';
import 'package:atahope/view_screen/dinne_ing/atahope_screen/s5.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:atahope/helper/navigation_helper/app_routes.dart';
import 'package:atahope/view_screen/dinne_ing/bills_page.dart';
import 'package:atahope/view_screen/dinne_ing/chat_page.dart';
import 'package:atahope/view_screen/dinne_ing/check_page.dart';
import 'package:atahope/view_screen/dinne_ing/profile_page.dart';
import 'package:atahope/view_screen/dinne_ing/scan_page.dart';
import 'package:atahope/view_screen/custom_bottom_nav.dart';
import 'package:flutter/services.dart';

class DinneIngPage extends StatefulWidget {
  const DinneIngPage({super.key});

  @override
  State<DinneIngPage> createState() => _DinneIngPageState();
}

class _DinneIngPageState extends State<DinneIngPage> {
  int _selectedIndex = 0;

  // Tab navigators (each tab keeps its own stack)
  final List<GlobalKey<NavigatorState>> _navigatorKeys = List.generate(
    5,
        (_) => GlobalKey<NavigatorState>(),
  );

  // Keep a history of tab selections
  final List<int> _navHistory = [0];

  final List<String> _routes = const [
    AppRoutes.bills,
    AppRoutes.check,
    AppRoutes.scan,
    AppRoutes.chat,
    AppRoutes.profile,
  ];

  Future<bool> _onWillPop() async {
    final currentNavigator = _navigatorKeys[_selectedIndex].currentState!;

    // 1️⃣ Try to pop inside current tab
    if (currentNavigator.canPop()) {
      currentNavigator.pop();
      return false;
    }

    // 2️⃣ Go back to previous tab (if available)
    if (_navHistory.length > 1) {
      setState(() {
        _navHistory.removeLast();
        _selectedIndex = _navHistory.last;
      });
      return false;
    }

    // 3️⃣ Otherwise allow app to close
    return true;
  }

  // Build a per-tab Navigator
  Widget _buildTabNavigator(int index, Widget child) {
    return Navigator(
      key: _navigatorKeys[index],
      onGenerateRoute: (settings) {
        Widget page = child;

        // Example: handle subpages here
        if (settings.name == AppRoutes.atahope_screen1) {
          page = const AtahopeScreen1();
        }else if(settings.name == AppRoutes.s1) {
          page = const s1();
        }
        else if(settings.name == AppRoutes.s2) {
          page = const s2();
        }
        else if(settings.name == AppRoutes.s3) {
          page = const s3();
        }
        else if(settings.name == AppRoutes.s4) {
          page = const s4();
        }
        else if(settings.name == AppRoutes.s5) {
          page = const s5();
        }

        return MaterialPageRoute(
          builder: (_) => page,
          settings: settings,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          // Keeps each tab alive (state preserved)
          child: IndexedStack(
            index: _selectedIndex,
            children: [
              _buildTabNavigator(0, const BillsPage()),
              _buildTabNavigator(1, const CheckPage()),
              _buildTabNavigator(2, const ScanPage()),
              _buildTabNavigator(3, const ChatPage()),
              _buildTabNavigator(4, const ProfilePage()),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomNav(
          currentIndex: _selectedIndex,
          onTap: (index) {
            if (_selectedIndex == index) {
              // Pop to root of same tab
              _navigatorKeys[index]
                  .currentState!
                  .popUntil((route) => route.isFirst);
            } else {
              // Change tab + track history
              setState(() {
                _selectedIndex = index;
                if (_navHistory.isEmpty || _navHistory.last != index) {
                  _navHistory.add(index);
                }
              });
            }

            if (kIsWeb) {
              SystemNavigator.routeInformationUpdated(
                location: _routes[index],
                replace: true,
              );
            }
          },
        ),
      ),
    );
  }
}

