import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:imran_ipa/common/custom_rounded_button.dart';
import 'package:imran_ipa/common/profile_picture.dart';
import 'package:imran_ipa/common/round_container.dart';
import 'package:imran_ipa/common/rounded_image_card.dart';
import 'package:imran_ipa/providers/page_route_provider.dart';
import 'package:imran_ipa/utils/style_sheet.dart';
import 'package:provider/provider.dart';

class EditCardScreen extends StatelessWidget {
  const EditCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Image Card"),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.75,
              child: Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.75,
                    child: const RoundedImageCard(imagePath: ""),
                  ),
                  Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.only(
                        top: 80, bottom: 10, left: 5, right: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Stack(
                              children: [
                                ProfilePicture(
                                  name: "Amir",
                                  imagePath: "",
                                ),
                                Positioned(
                                    bottom: -1,
                                    right: -1,
                                    child: RoundContainer(
                                      color: Colors.black,
                                      child: IconButton(
                                          padding: const EdgeInsets.all(4),
                                          constraints: const BoxConstraints(),
                                          color: Colors.red,
                                          onPressed: () {},
                                          icon: const FaIcon(
                                            FontAwesomeIcons.pen,
                                            size: 15,
                                            color: Colors.white,
                                          )),
                                    ))
                              ],
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
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 20,
                    top: 15,
                    child: ElevatedButton(
                      onPressed: () {
                        // Add your onPressed logic here
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 1,
                        backgroundColor:
                            hexToColor("#FFFFFF"), // Button background color
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(6.0), // Rounded corners
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.edit,
                            color: appRedColor,
                            size: 20, // Icon color
                          ),
                          const SizedBox(
                              width: 8), // Space between icon and text
                          Text(
                            'Customize',
                            style: TextStyle(
                              color: appRedColor, // Text color
                              fontSize: 14, // Text size
                            ),
                          ),
                        ],
                      ),
                    ),

                    //// Align
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
                  Provider.of<PageRouteProvider>(context, listen: false)
                      .setCustomisationState();
                },
                color: hexToColor("#E72D38"),
                isElevated: true,
              ))
        ],
      )),
    );
  }
}
