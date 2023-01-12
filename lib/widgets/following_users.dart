import 'package:flutter/material.dart';

import '../data/data.dart';
import '../models/user_model.dart';

class FollowingUsers extends StatelessWidget {
  const FollowingUsers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Text(
            "Following",
            style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 26.0,
                letterSpacing: 2),
          ),
        ),
        Container(
          height: 80,
          child: ListView.builder(
              padding: EdgeInsets.only(left: 10),
              scrollDirection: Axis.horizontal,
              itemCount: users.length,
              itemBuilder: (context, index) {
                User user = users[index];
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 2.0, color: Theme.of(context).primaryColor),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 12,
                            offset: Offset(0, 2),
                          ),
                        ]),
                    child: ClipOval(
                      child: Image(
                        height: 60.0,
                        width: 60.0,
                        fit: BoxFit.cover,
                        image: AssetImage (user.profileImageUrl.toString()),
                      ),
                      /*Image.asset(
                        "${user.backgroundImageUrl}",
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,

                      ),*/
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
