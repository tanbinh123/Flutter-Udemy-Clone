import 'package:UdemyClone/Screens/HomeScreens/MyList.dart';
import 'package:UdemyClone/Services/Authentication.dart';
import 'package:chewie/chewie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:video_player/video_player.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen({Key key}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  VideoPlayerController videoPlayerController =
      VideoPlayerController.network(Get.arguments['video_url']);
  ChewieController chewieController;
  Authentication authentication = Authentication();

  @override
  void initState() {
    super.initState();
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      looping: true,
      autoPlay: true,
      autoInitialize: true,
      aspectRatio: 16 / 9,
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.center,
              child: InkWell(
                child: Icon(EvaIcons.share),
                onTap: () {},
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.center,
              child: InkWell(
                child: Icon(EvaIcons.shoppingCartOutline),
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                        child: MyList(),
                        type: PageTransitionType.leftToRightWithFade),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Get.arguments['title'],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  Get.arguments['description'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(13.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 18.0,
                            ),
                            Text(
                              Get.arguments['ratings'],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(13.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 18.0,
                            ),
                            Text(
                              "${Get.arguments['enrolled']} Enrolled",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(13.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 18.0,
                            ),
                            Text(
                              "${Get.arguments['total_hours']} Total Hours",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(13.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 18.0,
                            ),
                            Text(
                              "Created By ${Get.arguments['author']}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(13.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 18.0,
                            ),
                            Text(
                              Get.arguments['language'],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(13.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 18.0,
                            ),
                            Text(
                              "Updated ${Get.arguments['updated_at']}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (!videoPlayerController.value.isPlaying) {
                    videoPlayerController.play();
                  }
                  Get.dialog(
                    WillPopScope(
                      // ignore: missing_return
                      onWillPop: () {
                        if (videoPlayerController.value.isPlaying) {
                          videoPlayerController.pause();
                        } else {
                          videoPlayerController.dispose();
                        }
                        Navigator.pop(context);
                      },
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Chewie(
                            controller: chewieController,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 300.0,
                    width: 400.0,
                    child: Center(
                      child: Stack(
                        children: [
                          ColorFiltered(
                            colorFilter: ColorFilter.mode(
                                Colors.black54, BlendMode.darken),
                            child: FadeInImage(
                              height: 200.0,
                              width: 400.0,
                              placeholder:
                                  AssetImage("assets/images/udemy_logo_2.png"),
                              image: NetworkImage(Get.arguments['image']),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 50.0,
                            left: 150.0,
                            child: Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 90.0,
                            ),
                          ),
                          Positioned(
                            top: 140.0,
                            left: 150.0,
                            child: Text(
                              "Tap to Play",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 50.0,
                width: 400.0,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    "Buy Now",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final QuerySnapshot result = await FirebaseFirestore
                            .instance
                            .collection('cart')
                            .where('user_id',
                                isEqualTo: authentication.user.uid)
                            .where('title', isEqualTo: Get.arguments['title'])
                            .get();

                        final List<DocumentSnapshot> documents = result.docs;

                        if (documents.length > 0) {
                          Get.snackbar(
                            'Oh no',
                            "${Get.arguments['title']} already added to cart",
                            colorText: Colors.white,
                            snackPosition: SnackPosition.TOP,
                          );
                        } else {
                          FirebaseFirestore.instance.collection('cart').add({
                            'user_id': authentication.user.uid,
                            'title': Get.arguments['title'],
                            'image': Get.arguments['image'],
                            'author': Get.arguments['author'],
                            'price': Get.arguments['price'],
                            'discount': Get.arguments['discount'],
                            'description': Get.arguments['description'],
                            'ratings': Get.arguments['ratings'],
                            'total_hours': Get.arguments['total_hours'],
                            'enrolled': Get.arguments['enrolled'],
                          }).whenComplete(() => {
                                Get.snackbar(
                                  'Success',
                                  "${Get.arguments['title']} added to cart",
                                  colorText: Colors.white,
                                  snackPosition: SnackPosition.TOP,
                                ),
                              });
                        }
                      },
                      child: Container(
                        height: 40.0,
                        width: 170.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: Text(
                            "Add to Cart",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        final QuerySnapshot result = await FirebaseFirestore
                            .instance
                            .collection('wishlist')
                            .where('user_id',
                                isEqualTo: authentication.user.uid)
                            .where('title', isEqualTo: Get.arguments['title'])
                            .get();

                        final List<DocumentSnapshot> documents = result.docs;

                        if (documents.length > 0) {
                          Get.snackbar(
                            'Oh no',
                            "${Get.arguments['title']} already added to wishlist",
                            colorText: Colors.white,
                            snackPosition: SnackPosition.TOP,
                          );
                        } else {
                          FirebaseFirestore.instance
                              .collection('wishlist')
                              .add({
                            'user_id': authentication.user.uid,
                            'title': Get.arguments['title'],
                            'image': Get.arguments['image'],
                            'author': Get.arguments['author'],
                            'price': Get.arguments['price'],
                            'discount': Get.arguments['discount'],
                            'description': Get.arguments['description'],
                            'ratings': Get.arguments['ratings'],
                            'total_hours': Get.arguments['total_hours'],
                            'enrolled': Get.arguments['enrolled'],
                          }).whenComplete(() => {
                                    Get.snackbar(
                                      'Success',
                                      "${Get.arguments['title']} added to wishlist",
                                      colorText: Colors.white,
                                      snackPosition: SnackPosition.TOP,
                                    ),
                                  });
                        }
                      },
                      child: Container(
                        height: 40.0,
                        width: 170.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: Text(
                            "Add to Wishlist",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
