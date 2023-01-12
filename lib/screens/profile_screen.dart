import 'package:flutter/material.dart';
import 'package:social_app/widgets/custom_drawer.dart';
import 'package:social_app/widgets/posts_carousel.dart';

import '../models/user_model.dart';
import '../widgets/profile_clipper.dart';

class ProfileScreen extends StatefulWidget {
  final User? user;

  const ProfileScreen({Key? key, this.user}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  PageController? _yourPostsPageController;
  PageController? _favoritePageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _yourPostsPageController = PageController(initialPage: 0,viewportFraction: 0.8);
    _favoritePageController = PageController(initialPage: 0,viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipPath(
                  clipper: ProfileClipper(),
                  child: Image(
                    height: 300,
                    width: double.infinity,
                    image: AssetImage(
                      widget.user!.backgroundImageUrl.toString(),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 50.0,
                  left: 20.0,
                  child: IconButton(
                    icon: Icon(Icons.menu),
                    iconSize: 30.0,
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      _scaffoldKey.currentState!.openDrawer();
                    },
                  ),
                ),
                Positioned(
                  bottom: 10,
                  child: Container(
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, boxShadow: [
                      BoxShadow(
                          color: Colors.black45,
                          offset: Offset(0, 2),
                          blurRadius: 6.0),
                    ]),
                    child: ClipOval(
                      child: Image(
                        height: 120.0,
                        width: 120.0,
                        image:
                            AssetImage(widget.user!.profileImageUrl.toString()),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                widget.user!.name.toString(),
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      "Following",
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 22.0,
                      ),
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    Text(
                      widget.user!.following.toString(),
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Followers",
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 22.0,
                      ),
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    Text(
                      widget.user!.followers.toString(),
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ],
            ),
            PostsCarousel(pageController: _yourPostsPageController,title: "Your Post",

            posts:widget.user!.posts,),
            PostsCarousel(pageController: _favoritePageController,title: "Your Favorite",

            posts:widget.user!.favorites,),
          ],
        ),
      ),
    );
  }
}
