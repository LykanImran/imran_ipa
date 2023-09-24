import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imran_ipa/common/custom_elevated_btn.dart';
import 'package:imran_ipa/common/round_container.dart';
import 'package:imran_ipa/providers/image_provider.dart';
import 'package:imran_ipa/providers/page_route_provider.dart';
import 'package:imran_ipa/utils/style_sheet.dart';
import 'package:provider/provider.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    XFile? image;

    Future<XFile> croppedImage() async {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: image!.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Edit Photo',
              toolbarColor: Colors.white,
              //  statusBarColor: Colors.red,
              toolbarWidgetColor: Colors.black,
              // backgroundColor: Colors.yellow,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Edit Photo',
          ),
          WebUiSettings(
            context: context,
          ),
        ],
      );

      XFile tempFile = XFile(
        croppedFile!.path,
        bytes: await croppedFile.readAsBytes(),
      );
      return tempFile;
    }

    Future<void> _pickImage(ImageSource source) async {
      final picker = ImagePicker();
      final pickedImage = await picker.pickImage(source: source);
      image = pickedImage;

      if (pickedImage != null) {
        debugPrint("Image Picked and Path is : ${pickedImage.path}");
        //String path = croppedImage();
        XFile tFile = await croppedImage();
        debugPrint("B4 ImageProv");
        Provider.of<ImgProvider>(context, listen: false)
            .setPickedImage(tFile);
        debugPrint("B4 Routing");

        Provider.of<PageRouteProvider>(context, listen: false)
            .setTemplateCardState();
      }
    }

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
                        _pickImage(ImageSource.camera);
                        Navigator.pop(context);
                      },
                      icon: FaIcon(
                        FontAwesomeIcons.camera,
                        color: hexToColor("#E72D38"),
                      ),
                      // icon: Icon(
                      //   Icons.camera,
                      //   color: hexToColor("#E72D38"),
                      // ),
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
                              _pickImage(ImageSource.gallery);
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
