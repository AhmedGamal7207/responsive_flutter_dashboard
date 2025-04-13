import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:fitness_dashboard/widgets/dashboard_widget.dart';
import 'package:fitness_dashboard/widgets/side_menu_widget.dart';
import 'package:fitness_dashboard/screens/empty_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  bool isLoading = true;
  bool isSidebarVisible = true;

  @override
  void initState() {
    super.initState();
    simulateLoading();
  }

  void simulateLoading() async {
    setState(() {
      isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      isLoading = false;
    });
  }

  void handleMenuTap(int index) {
    setState(() {
      selectedIndex = index;
    });

    if (index == 0) {
      simulateLoading();
    }
  }

  void toggleSidebar() {
    setState(() {
      isSidebarVisible = !isSidebarVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content;

    if (selectedIndex == 0) {
      content =
          isLoading
              ? Center(
                child: Lottie.asset(
                  'assets/lotties/student_loading.json',
                  width: 300,
                  height: 300,
                ),
              )
              : const DashboardWidget();
    } else {
      content = const EmptyScreen();
    }

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Sidebar - Slide in/out
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              top: 0,
              bottom: 0,
              left: isSidebarVisible ? 0 : -220,
              child: Container(
                width: 220,
                color: Colors.white, // or any background color
                child: SideMenuWidget(
                  selectedIndex: selectedIndex,
                  onItemTap: handleMenuTap,
                ),
              ),
            ),

            // Main content area
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              left: isSidebarVisible ? 220 : 0,
              top: 0,
              right: 0,
              bottom: 0,
              child: Stack(
                children: [
                  content,
                  Positioned(
                    bottom: 16,
                    left: 26,
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: FloatingActionButton(
                        backgroundColor: Colors.white,
                        onPressed: toggleSidebar,
                        child: Icon(
                          isSidebarVisible ? Icons.arrow_back : Icons.menu,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
