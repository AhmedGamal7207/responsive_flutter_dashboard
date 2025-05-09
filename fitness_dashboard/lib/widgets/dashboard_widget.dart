import 'package:fitness_dashboard/widgets/activity_details_card.dart';
import 'package:fitness_dashboard/widgets/header_widget.dart';
import 'package:fitness_dashboard/widgets/line_chart_card.dart';
import 'package:flutter/material.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            SizedBox(height: 10),
            HeaderWidget(),
            SizedBox(height: 10),
            ActivityDetailsCard(),
            SizedBox(height: 10),
            LineChartCard(),
          ],
        ),
      ),
    );
  }
}
