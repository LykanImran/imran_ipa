import 'package:flutter/material.dart';
import 'package:imran_ipa/common/custom_rounded_button.dart';
import 'package:imran_ipa/common/rounded_image_card.dart';
import 'package:imran_ipa/providers/image_provider.dart';
import 'package:imran_ipa/utils/style_sheet.dart';
import 'package:imran_ipa/view_model/template_card_view_model.dart';
import 'package:provider/provider.dart';

class TemplateCardScreen extends StatelessWidget {
  const TemplateCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final imgProv = Provider.of<ImgProvider>(context, listen: false);
    final templateCardView =
        Provider.of<TemplateCardViewModel>(context, listen: false);
    debugPrint("file path : ${imgProv.image.path}");
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
                      imagePath:
                          imgProv.image != null ? imgProv.image.path : "")),
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
                    templateCardView.uploadCardImage(context);
                  },
                  color: hexToColor("#E72D38"),
                  isElevated: true,
                ),
              )
            ],
          )),
    );
  }
}
