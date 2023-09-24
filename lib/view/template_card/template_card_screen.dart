import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imran_ipa/common/custom_rounded_button.dart';
import 'package:imran_ipa/common/rounded_image_card.dart';
import 'package:imran_ipa/common/upload_progress_dialog.dart';
import 'package:imran_ipa/providers/image_provider.dart';
import 'package:imran_ipa/providers/page_route_provider.dart';
import 'package:imran_ipa/services/database_services.dart';
import 'package:imran_ipa/utils/helper.dart';
import 'package:imran_ipa/utils/style_sheet.dart';
import 'package:provider/provider.dart';

class TemplateCardScreen extends StatelessWidget {
  const TemplateCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    XFile? file = Provider.of<ImgProvider>(context, listen: false).image;
    debugPrint("file path : ${file.path}");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Artist"),
      ),
      body: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: RoundedImageCard(
                      imagePath: file != null ? file.path : "")),
              const SizedBox(
                height: 15,
              ),
              const Text("Picture ready to be saved"),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                width: double.maxFinite,
                child: CustomRoundedButton(
                  text: "Save & Continue",
                  onPressed: () async {
                    double fSize = await getImageFileSizeInMB(file.path);
                    debugPrint("file Size == $fSize");
                    debugPrint("file type == ${file.name}");
                    debugPrint("file type == ${file.name.toUpperCase()}");
                    //file.name = file.name.toUpperCase();
                    debugPrint("file type == ${file.runtimeType}");
                    debugPrint("file type == ${file.mimeType}");

                    if (fSize < 10) {
                      _showUploadDialog(context);
                      DatabaseServices().uploadCardImage(context, file);
                    } else {
                      // ignore: use_build_context_synchronously
                      Flushbar(
                        flushbarPosition: FlushbarPosition.TOP,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 50),
                        borderRadius: BorderRadius.circular(10),
                        title: "File size is Greater than 10 MB",
                        message: "Please choose file size lower than 10 MB",
                        icon: Icon(
                          Icons.error_outline,
                          size: 30.0,
                          color: appRedColor,
                        ),
                        duration: const Duration(seconds: 4),
                        leftBarIndicatorColor: appRedColor,
                      ).show(context);
                    }
                  },
                  color: hexToColor("#E72D38"),
                  isElevated: true,
                ),
              )
            ],
          )),
    );
  }

  void _showUploadDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return UploadProgressDialog(
          onPressed: () {
            Navigator.pop(context);

            Provider.of<PageRouteProvider>(context, listen: false)
                .setCardViewState();
          },
          // Replace with your actual upload progress (0.0 to 1.0).
        );
      },
    );
  }
}
