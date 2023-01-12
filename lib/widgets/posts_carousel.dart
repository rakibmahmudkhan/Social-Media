import 'package:flutter/material.dart';
 import '../models/post_model.dart';

class PostsCarousel extends StatelessWidget {
final PageController? pageController;
  final String? title;
  final List<Post>? posts;
 // final Animation<double> animation;

    PostsCarousel({super.key, required this.pageController, this.posts, this.title});

  _buildPost(BuildContext context, int index) {
    Post post = posts![index];
    return AnimatedBuilder(
      animation: pageController!.position,
      builder: (context  , widget  ) {
        double value = 1;
        if (pageController!.position.haveDimensions) {
            value = pageController!.page! - index;
          value = (1 - (value.abs() * 0.35)).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 400.0,
            child: widget,
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(15.0),
                // ignore: prefer_const_literals_to_create_immutables
                boxShadow: [
                  const BoxShadow(
                      color: Colors.black12,
                      blurRadius: 7,
                      offset: Offset(0, 2))
                ]),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image(
                  height: MediaQuery.of(context).size.height*0.62,
                  width: MediaQuery.of(context).size.width*0.72,
                  fit: BoxFit.cover,
                  image: AssetImage("${post.imageUrl}"),
                )),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Container(
              height: 120,
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(15.0),
                  bottomLeft: Radius.circular(15.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.title.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 24.0),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    post.location.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18.0),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                          const SizedBox(
                            width: 6.0,
                          ),
                          Text(
                            post.likes.toString(),
                            style: const TextStyle(fontSize: 18.0),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.comment,
                            color: Theme.of(context).primaryColor,
                          ),
                          const SizedBox(
                            width: 6.0,
                          ),
                          Text(
                            post.comments.toString(),
                            style: const TextStyle(fontSize: 18.0),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Text(
            title!,
            style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 26.0,
                letterSpacing: 2),
          ),
        ),
        Container(
          height: 400,
          child: PageView.builder(
              controller: pageController,
              itemCount: posts!.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildPost(context, index);
              }),
        ),
      ],
    );
  }
}
