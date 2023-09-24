import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:imran_ipa/common/custom_rounded_button.dart';
import 'package:imran_ipa/common/glass_container.dart';
import 'package:imran_ipa/common/profile_picture.dart';
import 'package:imran_ipa/common/rounded_image_card.dart';
import 'package:imran_ipa/providers/page_route_provider.dart';
import 'package:imran_ipa/utils/style_sheet.dart';
import 'package:provider/provider.dart';

class CardViewScreen extends StatelessWidget {
  const CardViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double bigIconSize = 30;
    double smallIconSize = 10;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen Design"),
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GlassContainer(
                                      size: bigIconSize,
                                      child:
                                          const FaIcon(FontAwesomeIcons.skype)),
                                  GlassContainer(
                                      size: bigIconSize,
                                      child: const Icon(Icons.mail_rounded)),
                                  GlassContainer(
                                      size: bigIconSize,
                                      child:
                                          const FaIcon(FontAwesomeIcons.phone)),
                                  GlassContainer(
                                      size: bigIconSize,
                                      child: const FaIcon(
                                          FontAwesomeIcons.locationPin)),
                                  GlassContainer(
                                      size: bigIconSize,
                                      child:
                                          const FaIcon(FontAwesomeIcons.globe)),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      style: DefaultTextStyle.of(context).style,
                                      children: const <TextSpan>[
                                        TextSpan(
                                          text: 'el',
                                          style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontSize: 18.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Red',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 24.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      GlassContainer(
                                          size: smallIconSize,
                                          child: const Icon(
                                            Icons.person,
                                            size: 12,
                                          )),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Text('Profile')
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        )
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
                text: "Edit Card",
                onPressed: () {
                  Provider.of<PageRouteProvider>(context, listen: false)
                      .setEditCardState();
                },
                color: hexToColor("#E72D38"),
                isElevated: false,
              ))
        ],
      )),
    );
  }
}
