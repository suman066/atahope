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
  int _selectedIndex = 0; // Start on first tab (Atahope tab)

  // Each tab keeps its own navigator state
  final List<GlobalKey<NavigatorState>> _navigatorKeys =
  List.generate(5, (_) => GlobalKey<NavigatorState>());

  // History of tab selections for back button
  final List<int> _navHistory = [0];

  // Routes for web URL updates
  final List<String> _routes = const [
    AppRoutes.atahope_screen1, // first tab starts with Atahope
    AppRoutes.check,
    AppRoutes.scan,
    AppRoutes.chat,
    AppRoutes.profile,
  ];

  Future<bool> _onWillPop() async {
    final currentNavigator = _navigatorKeys[_selectedIndex].currentState!;

    // Pop inside current tab if possible
    if (currentNavigator.canPop()) {
      currentNavigator.pop();
      return false;
    }

    // Go back to previous tab if any
    if (_navHistory.length > 1) {
      setState(() {
        _navHistory.removeLast();
        _selectedIndex = _navHistory.last;
      });
      return false;
    }

    // Otherwise allow app to close
    return true;
  }

  // Build a navigator for each tab
  Widget _buildTabNavigator(int index, Widget initialPage) {
    return Navigator(
      key: _navigatorKeys[index],
      onGenerateRoute: (settings) {
        // initial route ('/' or null) -> show the tab's initial page
        Widget page = initialPage;

        if (settings.name != null && settings.name != '/') {
          switch (settings.name) {
          // First tab routes
            case AppRoutes.bills:
              page = const BillsPage();
              break;
            case AppRoutes.atahope_screen1:
              page = const AtahopeScreen1();
              break;
            case AppRoutes.atahopeScreen2:
              page = const AtahopeScreen2();
              break;
            case AppRoutes.atahopeScreen3:
              page = const AtahopeScreen3();
              break;
            case AppRoutes.s4:
              page = const s4();
              break;
            case AppRoutes.s5:
              page = const s5();
              break;

          // You can add more routes per tab here if needed
          }
        }

        return MaterialPageRoute(
          builder: (_) => page,
          settings: settings,
        );
      },
    );
  }

  void _handleTabTap(int index) {
    if (index == 0) {
      // 🔹 Bills tab tapped
      setState(() {
        if (_selectedIndex != 0) {
          _selectedIndex = 0;
          if (_navHistory.isEmpty || _navHistory.last != 0) {
            _navHistory.add(0);
          }
        }
      });

      final nav = _navigatorKeys[0].currentState;
      if (nav != null) {
        // Replace whatever is in first tab stack with BillsPage
        // So: AtahopeScreen1 is NOT shown again after this
        nav.pushNamedAndRemoveUntil(
          AppRoutes.bills,
              (route) => false,
        );
      }
    } else {
      // 🔹 Other tabs (Check, Scan, Chat, Profile)
      if (_selectedIndex == index) {
        // Same tab re-tap → pop to root
        _navigatorKeys[index]
            .currentState!
            .popUntil((route) => route.isFirst);
      } else {
        // Switch to another tab
        setState(() {
          _selectedIndex = index;
          if (_navHistory.isEmpty || _navHistory.last != index) {
            _navHistory.add(index);
          }
        });
      }
    }

    // Update web URL
    if (kIsWeb) {
      SystemNavigator.routeInformationUpdated(
        location: _routes[index],
        replace: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: IndexedStack(
            index: _selectedIndex,
            children: [
              // 🔹 First tab root = AtahopeScreen1 (Bills NOT shown initially)
              _buildTabNavigator(0, const AtahopeScreen1()),
              _buildTabNavigator(1, const CheckPage()),
              _buildTabNavigator(2, const ScanPage()),
              _buildTabNavigator(3, const ChatPage()),
              _buildTabNavigator(4, const ProfilePage()),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomNav(
          currentIndex: _selectedIndex,
          onTap: _handleTabTap,
        ),
      ),
    );
  }
}
