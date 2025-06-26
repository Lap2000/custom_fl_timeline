import 'package:example/pages/demo_curve_timeline.dart';
import 'package:example/pages/demo_custom_timeline.dart';
import 'package:example/pages/demo_custom_timeline_2.dart';
import 'package:example/pages/demo_custom_timeline_3.dart';
import 'package:example/pages/demo_straight_timeline.dart';
import 'package:example/widgets/page_content.dart';
import 'package:example/widgets/sidebar_content.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Flutter Timeline',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Inter',
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

// List of sidebar items
final List<SidebarItem> sidebarItems = [
  SidebarItem(
    id: 0,
    title: 'Custom Timeline',
    icon: Icons.timeline,
    content: PageContent(
      title: 'Custom Timeline 1',
      child: DemoCustomTimeline(),
    ),
  ),
  SidebarItem(
    id: 1,
    title: 'Custom Timeline 2',
    icon: Icons.chair_sharp,
    content: PageContent(
      title: 'Custom Timeline 2',
      child: DemoCustomTimeline2(),
    ),
  ),
  SidebarItem(
    id: 2,
    title: 'Custom Timeline 3',
    icon: Icons.analytics,
    content: PageContent(
      title: 'Custom Timeline 3',
      child: DemoCustomTimeline3(),
    ),
  ),
  SidebarItem(
    id: 3,
    title: 'Curve timeline',
    icon: Icons.crib_rounded,
    content: PageContent(
      title: 'Curve timeline',
      child: DemoCurveTimeline(),
    ),
  ),
  SidebarItem(
    id: 4,
    title: 'Straight timeline',
    icon: Icons.straight,
    content: PageContent(
      title: 'Straight timeline',
      child: DemoStraightTimeline(),
    ),
  ),
];

// Main page widget
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  bool _isSidebarExpanded = true;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (MediaQuery.of(context).size.width < mobileBreakpoint) {
      Navigator.pop(context);
    }
  }

  void _toggleSidebarExpansion() {
    setState(() {
      _isSidebarExpanded = !_isSidebarExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < mobileBreakpoint;
    double sidebarWidth = _isSidebarExpanded ? 250 : 80;
    if (isMobile) {
      sidebarWidth = 0;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Timeline Example Dashboard',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueGrey.shade700,
        foregroundColor: Colors.white,
        elevation: 4,
        leading: isMobile
            ? Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu, size: 28),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              )
            : null,
      ),
      drawer: isMobile
          ? Drawer(
              width: 250,
              backgroundColor: Colors.blueGrey.shade800,
              child: SidebarContent(
                isExpanded: true,
                selectedIndex: _selectedIndex,
                onItemTapped: _onItemTapped,
                isMobile: isMobile,
                sidebarItems: sidebarItems,
              ),
            )
          : null,
      body: Row(
        children: [
          if (!isMobile)
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: sidebarWidth,
              color: Colors.blueGrey.shade800,
              curve: Curves.easeInOut,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 8,
                    ),
                    child: Align(
                      alignment: _isSidebarExpanded
                          ? Alignment.centerRight
                          : Alignment.center,
                      child: IconButton(
                        icon: Icon(
                          _isSidebarExpanded
                              ? Icons.chevron_left
                              : Icons.chevron_right,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: _toggleSidebarExpansion,
                        tooltip: _isSidebarExpanded ? 'Collapse' : 'Expand',
                        splashRadius: 24,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SidebarContent(
                      isExpanded: _isSidebarExpanded,
                      selectedIndex: _selectedIndex,
                      onItemTapped: _onItemTapped,
                      isMobile: isMobile,
                      sidebarItems: sidebarItems,
                    ),
                  ),
                ],
              ),
            ),
          Expanded(
            child: Container(
              color: Colors.grey.shade100,
              child: sidebarItems[_selectedIndex].content,
            ),
          ),
        ],
      ),
    );
  }
}
