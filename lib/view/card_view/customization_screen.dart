import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:imran_ipa/common/custom_rounded_button.dart';
import 'package:imran_ipa/common/profile_picture.dart';
import 'package:imran_ipa/common/rounded_image_card.dart';
import 'package:imran_ipa/utils/style_sheet.dart';

class CustomizationScreen extends StatelessWidget {
  const CustomizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double bigIconSize = 30;
    double smallIconSize = 10;
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
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.65,
              child: Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: const RoundedImageCard(imagePath: ""),
                  ),
                  Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.only(
                        top: 35, bottom: 10, left: 5, right: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            ProfilePicture(
                              name: "Amir",
                              imagePath: "",
                            ),
                            const Text(
                              "Alexandra",
                              style: TextStyle(
                                  fontSize: 36, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "Stanton",
                              style: TextStyle(fontSize: 20),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const Text(
                              "Realtor | VP Design",
                              style: TextStyle(fontSize: 20),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "Bangalore, India",
                              style: TextStyle(fontSize: 20),
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
