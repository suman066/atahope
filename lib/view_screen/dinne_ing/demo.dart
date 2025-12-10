import 'package:atahope/helper/navigation_helper/navigation_helper.dart';
import 'package:atahope/view_screen/dinne_ing/atahope_screen/atahope_screen1.dart';
import 'package:atahope/view_screen/dinne_ing/atahope_screen/atahope_screen2.dart';
import 'package:atahope/view_screen/dinne_ing/atahope_screen/atahope_screen3.dart';
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
  /// ⭐ START WITHOUT ANY TAB SELECTED
  int _selectedIndex = -1;

  final List<GlobalKey<NavigatorState>> _navigatorKeys = List.generate(
    5,
        (_) => GlobalKey<NavigatorState>(),
  );

  final List<int> _navHistory = [];

  final List<String> _routes = const [
    AppRoutes.bills,
    AppRoutes.check,
    AppRoutes.scan,
    AppRoutes.chat,
    AppRoutes.profile,
  ];

  Future<bool> _onWillPop() async {
    if (_selectedIndex == -1) return true;

    final nav = _navigatorKeys[_selectedIndex].currentState!;

    if (nav.canPop()) {
      nav.pop();
      return false;
    }

    if (_navHistory.length > 1) {
      setState(() {
        _navHistory.removeLast();
        _selectedIndex = _navHistory.last;
      });
      return false;
    }

    return true;
  }

  Widget _buildTabNavigator(int index, Widget rootPage) {
    return Navigator(
      key: _navigatorKeys[index],
      onGenerateRoute: (settings) {
        Widget page = rootPage;

        if (settings.name == AppRoutes.atahope_screen1) {
          page = const AtahopeScreen1();
        } else if (settings.name == AppRoutes.atahopeScreen2) {
          page = const AtahopeScreen2();
        } else if (settings.name == AppRoutes.atahopeScreen3) {
          page = const AtahopeScreen3();
        } else if (settings.name == AppRoutes.s4) {
          page = const s4();
        } else if (settings.name == AppRoutes.s5) {
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

        /// ⭐ SHOW AtahopeScreen1 WHEN NO TAB SELECTED
        body: _selectedIndex == -1
            ? const AtahopeScreen1()
            : SafeArea(
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
          /// ⭐ IF NO SELECTION, BOTTOM NAV SHOWS FIRST ITEM BUT NOT USED
          currentIndex: _selectedIndex == -1 ? 0 : _selectedIndex,

          onTap: (index) {
            if (_selectedIndex == -1) {
              // First time selecting ANY tab
              setState(() {
                _selectedIndex = index;
                _navHistory.add(index);
              });
              return;
            }

            final nav = _navigatorKeys[index].currentState!;

            if (_selectedIndex == index) {
              if (index == 0) {
                while (nav.canPop()) {
                  nav.pop();
                }
              } else {
                nav.popUntil((route) => route.isFirst);
              }
            } else {
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
