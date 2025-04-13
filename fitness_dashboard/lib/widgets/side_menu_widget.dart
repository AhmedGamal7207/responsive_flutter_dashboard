import 'package:flutter/material.dart';
import 'package:fitness_dashboard/constant/constants.dart';
import 'package:fitness_dashboard/data/side_menu_data.dart';

class SideMenuWidget extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTap;

  const SideMenuWidget({
    super.key,
    required this.selectedIndex,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    final data = SideMenuData();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      color: Color.fromRGBO(21, 19, 28, 1), // 1.0 = full opacity,
      child: ListView.builder(
        itemCount: data.menu.length,
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;

          return Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(6)),
              color: isSelected ? selectionColor : Colors.transparent,
            ),
            child: InkWell(
              onTap: () => onItemTap(index),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 13,
                      vertical: 7,
                    ),
                    child: Icon(
                      data.menu[index].icon,
                      color: isSelected ? Colors.black : Colors.grey,
                    ),
                  ),
                  Text(
                    data.menu[index].title,
                    style: TextStyle(
                      fontSize: 16,
                      color: isSelected ? Colors.black : Colors.grey,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
