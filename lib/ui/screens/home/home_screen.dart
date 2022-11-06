import 'package:bloc_app/ui/core/layouts/base_scaffold.dart';
import 'package:bloc_app/ui/resources/colors/colors.dart';
import 'package:bloc_app/ui/screens/posts/post_screen.dart';
import 'package:bloc_app/ui/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      builder: (context, theme) {
        return SafeArea(
          child: DefaultTabController(
            length: 2,
            initialIndex: 0,
            child: Column(
              children: const [
                Expanded(
                  /// layouts
                  child: TabBarView(
                    children: [
                      PostScreen(),
                      ProfileScreen(),
                    ],
                  ),
                ),

                /// tabs
                TabBar(
                  labelColor: DesignColors.primaryColor,
                  unselectedLabelColor: DesignColors.secondaryColor,
                  indicatorColor: DesignColors.primaryColor,
                  tabs: [
                    Tab(icon: Icon(Icons.home)),
                    Tab(icon: Icon(Icons.person)),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
