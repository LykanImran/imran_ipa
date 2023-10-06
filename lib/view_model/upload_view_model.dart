import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imran_ipa/providers/image_provider.dart';
import 'package:imran_ipa/providers/page_route_provider.dart';
import 'package:provider/provider.dart';

class UploadViewModel extends ChangeNotifier {
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
      ],
    );

    XFile tempFile = XFile(
      croppedFile!.path,
      bytes: await croppedFile.readAsBytes(),
    );
    return tempFile;
  }

  Future<void> pickImage(ImageSource source, BuildContext context) async {
    final picker = ImagePicker();
    final imgProv = Provider.of<ImgProvider>(context, listen: false);
    final pageRouteProv =
        Provider.of<PageRouteProvider>(context, listen: false);
    final pickedImage = await picker.pickImage(source: source);
    image = pickedImage;

    if (pickedImage != null) {
      debugPrint("Image Picked and Path is : ${pickedImage.path}");
      XFile tFile = await croppedImage();
      debugPrint("B4 ImageProv");
      imgProv.setPickedImage(tFile);
      debugPrint("B4 Routing");
      pageRouteProv.setTemplateCardState();
    }
    notifyListeners();
  }
}
