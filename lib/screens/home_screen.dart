import 'package:flutter/material.dart';
import 'package:social_app/data/data.dart';

import '../widgets/custom_drawer.dart';
import '../widgets/following_users.dart';
import '../widgets/posts_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        bottom: TabBar(
         indicatorWeight: 2.0,
          unselectedLabelStyle:
              const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
          labelStyle:
              const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
          labelColor: Theme.of(context).primaryColor,
          controller: _tabController,
          // ignore: prefer_const_literals_to_create_immutables
          tabs: <Widget>[
            const Tab(
              text: "Trending",
            ),
            const Tab(
              text: "Latest",
            ),
          ],
        ),
        centerTitle: true,
        title: const Text(
          'CONNECT',
          style: TextStyle(
              color: Colors.teal,
              fontWeight: FontWeight.bold,
              letterSpacing: 4),
        ),
      ),
      drawer: CustomDrawer(),
      body: ListView(
        children: [
          const FollowingUsers(),
          PostsCarousel(
              pageController: _pageController, title: "Posts", posts: posts),
        ],
      ),
    );
  }
}
