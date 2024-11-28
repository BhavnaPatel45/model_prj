import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../controllers/homepage_controller.dart';

class HomeView extends GetView<HomeController> {
  final HomeController _homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(appBar: buildAppBar(), body: buildBody(context)));
  }

  Future<bool> _onWillPop() async {
    bool shouldPop = await showDialog(
      context: Get.context!,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Exit'),
        content: const Text('Are you sure you want to exit?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Get.back(result: false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Get.back(result: true),
            child: const Text('Yes'),
          ),
        ],
      ),
    );

    return shouldPop;
  }

  buildAppBar() {
    return AppBar(
        elevation: 1,
        centerTitle: true,
        title: const Text('Models',
            style: TextStyle(fontFamily: 'Parkinsans', fontSize: 18)),
        toolbarHeight: 60,
        backgroundColor: Colors.grey.shade200,
        actions: [
          IconButton(
              onPressed: () async {
                await _homeController.authRepo.logout();
              },
              icon: Icon(Icons.logout_rounded))
        ],
        leading: Padding(
            padding: EdgeInsets.only(left: 15.0, top: 10.0, bottom: 10.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
                padding: EdgeInsets.zero,
              ),
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 18,
              ),
            )));
  }

  buildBody(context) {
     double screenHeight = MediaQuery.of(context).size.height;
  double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child:  Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Expire In',
                        style: TextStyle(
                          fontFamily: 'Parkinsans',
                        ),
                      ),
                      Text(
                        '45 days',
                        style: TextStyle(fontFamily: 'Parkinsans'),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Model ID',
                          style: TextStyle(
                            fontFamily: 'Parkinsans',
                          )),
                      Text('ksinuser1234',
                          style: TextStyle(fontFamily: 'Parkinsans'))
                    ],
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    label: Text(
                      'Delete',
                      style: TextStyle(
                          color: Colors.black, fontFamily: 'Parkinsans'),
                    ),
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                // height: 400,
                // width: 360,
                 height: screenHeight * 0.5, 
            width: screenWidth * 0.9, 
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(8)),
                child: Image.asset(
                  'assets/model.png',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                // color: Colors.blue,
                decoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(2)),
                child: Padding(
                  padding: EdgeInsets.all(3),
                  child: const Text("262 × 352",
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'Parkinsans')),
                ),
              ),
              Stack(
                children: [
                  Container(
                height: screenHeight * 0.25,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.vertical(
                        top:Radius.circular(MediaQuery.of(context).size.width / 2),
                        bottom: Radius.zero,
                      ),
                    ),
                  ),
                  ..._generateSemiCircularAvatars(
                      _homeController.avatarImages, context),
                  Positioned(
                      bottom: 30,
                      // left: 140,
                       left: screenWidth / 2 - 50,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.black,
                        child: Icon(Icons.check, color: Colors.white, size: 32),
                      ))
                ],
              )
            ]))
 ,
    );
  }



List<Widget> _generateSemiCircularAvatars(
    List<String> images, BuildContext context) {
  int itemCount = images.length;

  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;

  double radius = screenWidth * 0.4;

  double angleRange = pi; 
  double startAngle = -pi / 2; 
  double angleStep = angleRange / (itemCount + 1);

  return List.generate(itemCount, (index) {
    double angle = startAngle + ((index + 1) * angleStep);

    return Positioned(
      top: radius * (1 - cos(angle)) + 10,
      left: screenWidth / 2 + radius * sin(angle) - 50,
      child: CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage(images[index]),
        backgroundColor: Colors.white,
      ),
    );
  });
}


}
