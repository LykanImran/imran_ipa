import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:imran_ipa/common/custom_rounded_button.dart';
import 'package:imran_ipa/common/profile_picture.dart';
import 'package:imran_ipa/providers/page_route_provider.dart';
import 'package:imran_ipa/utils/constants.dart';
import 'package:imran_ipa/utils/style_sheet.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';

class CustomizationScreen extends StatefulWidget {
  const CustomizationScreen({super.key});

  @override
  State<CustomizationScreen> createState() => _CustomizationScreenState();
}

const double min = pi * -2;
const double max = pi * 2;

const double minScale = 0.03;
const double defScale = 0.1;
const double maxScale = 0.6;

class _CustomizationScreenState extends State<CustomizationScreen> {
  late PhotoViewControllerBase controller;
  late PhotoViewScaleStateController scaleStateController;
  int calls = 0;

  @override
  void initState() {
    controller = PhotoViewController(initialScale: defScale)
      ..outputStateStream.listen(onController);

    scaleStateController = PhotoViewScaleStateController()
      ..outputScaleStateStream.listen(onScaleState);
    super.initState();
  }

  void onController(PhotoViewControllerValue value) {
    setState(() {
      calls += 1;
    });
  }

  void onScaleState(PhotoViewScaleState scaleState) {
    print(scaleState);
  }

  @override
  void dispose() {
    controller.dispose();
    scaleStateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double bigIconSize = 30;
    double smallIconSize = 10;
    double scale = 1.0;
    Offset position = const Offset(0.0, 0.0);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customize Your Card"),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: InkWell(
              onTap: () {
                Provider.of<PageRouteProvider>(context, listen: false)
                    .setEditCardState();
              },
              child: DottedBorder(
                borderType: BorderType.RRect,
                color: hexToColor("#CDDAEA"),
                radius: const Radius.circular(8),
                padding: const EdgeInsets.all(6),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  child: Container(
                    height: 40,
                    width: double.maxFinite,
                    color: hexToColor("#F6FAFF"),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.image,
                            color: hexToColor("#456EFF"),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Change picture here and adjust",
                            style: TextStyle(fontSize: 16),
                          )
                        ]),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.65,
              //width: double.maxFinite,
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: double.maxFinite,
                    color: Colors.red,
                    child: Center(
                      child: PhotoView(
                        imageProvider: NetworkImage(imgLink),
                        minScale: PhotoViewComputedScale.contained,
                        maxScale: PhotoViewComputedScale.covered * 2,
                        backgroundDecoration: const BoxDecoration(
                          color: Colors.black,
                        ),
                        controller: controller,
                        scaleStateController: scaleStateController,
                       // enableRotation: true,
                      ),
                    ),
                    // child: RoundedImageCard(
                    //   imagePath: imgLink,
                    //   isNetworkImage: true,
                    // ),
                  ),

                  /////
                  Container(
                    // color: Colors.green,
                    width: double.maxFinite,
                    padding: const EdgeInsets.only(
                        top: 35, bottom: 10, left: 5, right: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            ProfilePicture(
                              name: "Corleone",
                              imagePath: profImg,
                            ),
                            const Text(
                              "Alexandra",
                              style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "Stanton",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const Text(
                              "Realtor | VP Design",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "Bangalore, India",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              )),
          const SizedBox(
            height: 15,
          ),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              width: double.maxFinite,
              child: CustomRoundedButton(
                text: "Save",
                onPressed: () {
                  // Provider.of<PageRouteProvider>(context, listen: false)
                  //     .setEditCardState();
                },
                color: hexToColor("#E72D38"),
                isElevated: true,
              ))
        ],
      )),
    );
  }
}
