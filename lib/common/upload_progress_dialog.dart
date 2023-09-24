import 'package:flutter/material.dart';
import 'package:imran_ipa/common/custom_rounded_button.dart';
import 'package:imran_ipa/providers/upload_progress_provider.dart';
import 'package:imran_ipa/utils/style_sheet.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class UploadProgressDialog extends StatelessWidget {
  final VoidCallback onPressed;

  const UploadProgressDialog({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final uploadProgress = Provider.of<UploadProgressProvider>(context);
    return AlertDialog(
      title: Text(
          "${uploadProgress.progress < 1 ? 'Uploading' : 'Uploaded'}.... "),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 20),
          FittedBox(
            child: CircularPercentIndicator(
              radius: 50.0,
              lineWidth: 8.0,
              //animation: true,
              percent: uploadProgress.progress,
              circularStrokeCap: CircularStrokeCap.round,
              center: Text(
                "${(uploadProgress.progress * 100).toStringAsFixed(1)}%",
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 15.0),
              ),
              backgroundColor: Colors.red.withOpacity(0.15),
              progressColor: appRedColor,
            ),
          ),
          const SizedBox(height: 20),
          uploadProgress.progress < .99
              ? const SizedBox()
              : SizedBox(
                  width: 200,
                  // padding:
                  //     const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                  child: CustomRoundedButton(
                    text: "Done",
                    isElevated: false,
                    color: appRedColor,
                    onPressed: onPressed,
                  ),
                )
        ],
      ),
    );
  }
}
