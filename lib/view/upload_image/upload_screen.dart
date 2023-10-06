import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imran_ipa/common/custom_elevated_btn.dart';
import 'package:imran_ipa/common/round_container.dart';
import 'package:imran_ipa/utils/style_sheet.dart';
import 'package:imran_ipa/view_model/upload_view_model.dart';
import 'package:provider/provider.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final uploadView = Provider.of<UploadViewModel>(context);

    Future<void> _openImagePickerModal(BuildContext context) async {
      showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RoundContainer(
                        child: IconButton(
                      onPressed: () {
                        uploadView.pickImage(ImageSource.camera, context);
                        Navigator.pop(context);
                      },
                      icon: FaIcon(
                        FontAwesomeIcons.camera,
                        color: hexToColor("#E72D38"),
                      ),
                    )),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text("Camera")
                  ],
                ),
                const SizedBox(
                  width: 25,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RoundContainer(
                        child: IconButton(
                            onPressed: () {
                              uploadView.pickImage(
                                  ImageSource.gallery, context);
                              Navigator.pop(context);
                            },
                            icon: FaIcon(
                              FontAwesomeIcons.image,
                              color: hexToColor("#E72D38"),
                            )
                            // icon: Icon(
                            //   Icons.image_rounded,
                            //   color: hexToColor("#E72D38"),
                            // ),
                            )),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text("Gallery")
                  ],
                ),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Design"),
      ),
      body: SizedBox(
          width: double.maxFinite,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            //: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: CustomElevatedBtn(
              buttonColor: hexToColor("#D8E9FF"),
              onPressed: () async {
                await _openImagePickerModal(context).then((value) {});
              },
              text: "Upload Picture",
            ),
          )),
    );
  }
}
