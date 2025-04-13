import 'package:fitness_dashboard/util/responsive.dart';
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

  @override
  void initState() {
    super.initState();
    simulateLoading();
  }

  void simulateLoading() async {
    setState(() {
      isLoading = true;
    });

    // Simulate a 2-second loading period
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
      simulateLoading(); // Only show loading when Dashboard is re-selected
    }
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
    final isDesktop = Responsive.isDesktop(context);

    return Scaffold(
      drawer:
          !isDesktop
              ? SizedBox(
                width: 250,
                child: SideMenuWidget(
                  selectedIndex: selectedIndex,
                  onItemTap: handleMenuTap,
                ),
              )
              : null,
      body: SafeArea(
        child: Row(
          children: [
            if (isDesktop)
              Expanded(
                flex: 2,
                child: SideMenuWidget(
                  selectedIndex: selectedIndex,
                  onItemTap: handleMenuTap,
                ),
              ),
            Expanded(flex: 10, child: content),
          ],
        ),
      ),
    );
  }
}
