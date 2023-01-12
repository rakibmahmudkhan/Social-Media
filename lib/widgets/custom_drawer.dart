import 'package:flutter/material.dart';
import 'package:social_app/data/data.dart';
import 'package:social_app/screens/home_screen.dart';
import 'package:social_app/screens/login_screen.dart';
import 'package:social_app/screens/profile_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  ListTile _buildDrawerOption(Icon icon, String title, void Function() onTap) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(fontSize: 20.0),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Stack(
            children: [
              Image(
                height: 200,
                width: double.infinity,
                image: AssetImage(currentUser.backgroundImageUrl.toString()),
                fit: BoxFit.cover,
              ),
              Positioned(
                  bottom: 20,
                  left: 20,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).primaryColor,
                          border: Border.all(
                              width: 3.0,
                              color: Theme.of(context).primaryColor),
                        ),
                        child: ClipOval(
                          child: Image(
                            image: AssetImage(
                                currentUser.profileImageUrl.toString()),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 6.0,
                      ),
                      Text(
                        currentUser.name.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5),
                      )
                    ],
                  ))
            ],
          ),
          _buildDrawerOption(Icon(Icons.dashboard), "Home", () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return HomeScreen();
            }));
          }),
          _buildDrawerOption(Icon(Icons.chat), "Chat", () {}),
          _buildDrawerOption(Icon(Icons.location_on), "Map", () {}),
          _buildDrawerOption(Icon(Icons.account_circle), "Your Profile", () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
                  return   ProfileScreen(user: currentUser,);
                }));
          }),
          _buildDrawerOption(Icon(Icons.settings), "Settings", () {}),
         Expanded(child: Align(alignment: FractionalOffset.bottomCenter,
         child:  _buildDrawerOption(Icon(Icons.directions_run), "LogOut", () {
           Navigator.pushReplacement(context,
               MaterialPageRoute(builder: (context) {
                 return LoginScreen();
               }));
         }),),),

        ],
      ),
    );
  }
}
