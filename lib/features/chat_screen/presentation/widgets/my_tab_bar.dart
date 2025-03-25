import 'package:flutter/material.dart';
import 'package:nawah/core/theme/text_style.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      height: 80,
      color: TextStyles.kPrimaryColor,
      child: TabBar(
        controller: tabController,
        indicator: ShapeDecoration(
            color: TextStyles.kAccentColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            )),
        tabs: [
          Tab(
            icon: Text(
              'Chat',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Tab(
            icon: Text(
              'Status',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Tab(
            icon: Text(
              'Call',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
