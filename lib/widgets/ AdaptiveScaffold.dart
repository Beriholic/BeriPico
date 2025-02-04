import 'package:beripico/config/pages.dart';
import 'package:flutter/material.dart';

const double _largeScreenWidthThreshold = 600.0;

class AdaptiveScaffold extends StatefulWidget {
  final List<AppPage> appPages;

  const AdaptiveScaffold({
    super.key,
    required this.appPages,
  });

  @override
  State<AdaptiveScaffold> createState() => _AdaptiveScaffoldState();
}

class _AdaptiveScaffoldState extends State<AdaptiveScaffold> {
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > _largeScreenWidthThreshold) {
          return Scaffold(
            body: Row(
              children: [
                NavigationRail(
                    selectedIndex: _currentPageIndex,
                    onDestinationSelected: (int index) {
                      setState(() {
                        _currentPageIndex = index;
                      });
                    },
                    labelType: NavigationRailLabelType.all,
                    destinations: appPages
                        .map((page) => NavigationRailDestination(
                            icon: Icon(page.icon),
                            selectedIcon: Icon(page.iconSelected),
                            label: Text(page.name)))
                        .toList()),
                Expanded(
                  child: SafeArea(
                      child: IndexedStack(
                    index: _currentPageIndex,
                    children: appPages.map((page) => page.page).toList(),
                  )),
                ),
              ],
            ),
          );
        } else {
          return Scaffold(
            body: SafeArea(
                child: IndexedStack(
              index: _currentPageIndex,
              children: appPages.map((page) => page.page).toList(),
            )),
            bottomNavigationBar: BottomNavigationBar(
              items: appPages
                  .map(
                    (page) => BottomNavigationBarItem(
                        icon: Icon(page.icon),
                        label: page.name,
                        activeIcon: Icon(page.iconSelected)),
                  )
                  .toList(),
              currentIndex: _currentPageIndex,
              onTap: (int index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
            ),
          );
        }
      },
    );
  }
}
