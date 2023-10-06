import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imran_ipa/api_controller/api_manager.dart';
import 'package:imran_ipa/providers/upload_progress_provider.dart';
import 'package:imran_ipa/utils/api_endpoints.dart';
import 'package:imran_ipa/utils/constants.dart';
import 'package:provider/provider.dart';

class DatabaseServices with ChangeNotifier {
  uploadCardImage(BuildContext context, XFile file) async {
    var webLink = ApiEndpoint().cardImageUploadAPI;
    final uploadProgress =
        Provider.of<UploadProgressProvider>(context, listen: false);

    // final params = FormData.fromMap({
    //   'profileBannerImageURL': await MultipartFile.fromFile(
    //     file.path,
    //     filename: 'image.jpg',
    //   ),
    // });

    var params = {
      "profileBannerImageURL": await MultipartFile.fromFile(
        file.path,
        filename: file.name.toUpperCase(),
      )
    };
    debugPrint("Params printing ${params['profileBannerImageURL']}");

    debugPrint(
        "File Path :: -------------- > ${file.path} Name : ${file.name}");
    debugPrint("Web link :: -------------- > $webLink");
    debugPrint("Params in upload Card Img ------------- >  $params");
    debugPrint("Passing Tokens ---------------- > $token");
    try {
      ApiManager().callMultiPartApi(context, webLink, params, token,
          onProgress: (progress) {
        debugPrint("Upload Progress ::  --> $progress");
        String prog = progress.substring(0, progress.length - 1);
        uploadProgress.updateProgress(double.parse(prog) / 100);

        /// uploadBloc.changeUploadBlocState(progress);
      }).then((value) {
        debugPrint("Then Upload Progress ::  --> $value");
      }).catchError((e) {
        debugPrint("Catch Err Upload Progress ::  --> $e");

        // uploadBloc.changeUploadBlocState('');
      });
    } catch (e) {
      debugPrint("Catching error $e");
    }
  }
}
