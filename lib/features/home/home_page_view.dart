import 'dart:developer';

import 'package:finances/common/constants/app_colors.dart';
import 'package:finances/common/widgets/custom_bottom_app_bar.dart';
import 'package:finances/features/group/group_page.dart';
import 'package:finances/features/home/home_page.dart';
import 'package:finances/features/profile/profile_page.dart';
import 'package:finances/features/stats/stats_page.dart';
import 'package:flutter/material.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final pageController = PageController();

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      log(pageController.page.toString());
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const [
          HomePage(),
          StatsPage(),
          GroupPage(),
          ProfilePage(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        onPressed: () {},
        child: const Icon(Icons.add, color: AppColors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomAppBar(
        selectedItemColor: AppColors.primaryColor,
        children: [
          CustomBottomAppBarItem(
            label: 'Home',
            primaryIcon: Icons.home,
            secondaryIcon: Icons.home_outlined,
            onPressed: () => pageController.jumpToPage(0),
          ),
          CustomBottomAppBarItem(
            label: 'Stats',
            primaryIcon: Icons.bar_chart,
            secondaryIcon: Icons.bar_chart_outlined,
            onPressed: () => pageController.jumpToPage(1),
          ),
          const CustomBottomAppBarItem.empty(),
          CustomBottomAppBarItem(
            label: 'Group',
            primaryIcon: Icons.group,
            secondaryIcon: Icons.group_outlined,
            onPressed: () => pageController.jumpToPage(2),
          ),
          CustomBottomAppBarItem(
            label: 'Profile',
            primaryIcon: Icons.person,
            secondaryIcon: Icons.person_outlined,
            onPressed: () => pageController.jumpToPage(3),
          ),
        ],
      ),
    );
  }
}
