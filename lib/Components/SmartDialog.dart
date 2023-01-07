import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Styles/AppColors.dart';


class CustomDialog {
  static void showLoading({required String message}) {
    SmartDialog.showLoading(
      msg: message,
      backDismiss: false,
      alignment: Alignment.center,
      builder: (BuildContext context) {
        return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  width: 40,
                  height: 40,
                    child: CircularProgressIndicator()),
                const SizedBox(height: 10),
                Text(
                  message,
                  style: GoogleFonts.nunito(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ],
            ));
      },

    );
  }

  static void dismiss() {
    SmartDialog.dismiss();
  }

  static void showToast({required String message}) {
    SmartDialog.showToast(
      message,
      alignment: Alignment.center,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            message,
            style: GoogleFonts.nunito(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        );
      },
    );
  }

  static void showError({required String message}) {
    SmartDialog.show(
      maskColor: Colors.transparent,
      builder: (_) {
        return Card(
          elevation: 5,
          margin: const EdgeInsets.all(10),
          child: Container(
            height: 250,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.red,
                  child: Icon(
                    Icons.error,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w900),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: secondaryColor,
                        ),
                        child: Text(
                          'Okay',
                          style: GoogleFonts.nunito(color: Colors.white),
                        ),
                        onPressed: () => SmartDialog.dismiss(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void showSuccess({required String message}) {
    SmartDialog.show(
      maskColor: Colors.transparent,
      builder: (_) {
        return  Card(
          elevation: 5,
          margin: const EdgeInsets.all(10),
          child: Container(
            height: 250,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.green,
                  child: Icon(
                    Icons.check,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w900),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: secondaryColor,
                        ),
                        child: Text(
                          'Okay',
                          style: GoogleFonts.nunito(color: Colors.white),
                        ),
                        onPressed: () => SmartDialog.dismiss(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Future<void> showInfo(
      {required String message,
      VoidCallback? onPressed,
      required String buttonText}) async {
    SmartDialog.show(
      maskColor: Colors.transparent,
      builder: (_) {
        return Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.info,
                  size: 20,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                message,
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(color: Colors.white, fontSize: 14),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: secondaryColor,
                      ),
                      onPressed: onPressed,
                      child: Text(
                        buttonText,
                        style: GoogleFonts.nunito(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: secondaryColor,
                      ),
                      child: Text(
                        'Cancel',
                        style: GoogleFonts.nunito(color: Colors.white),
                      ),
                      onPressed: () => SmartDialog.dismiss(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static Future<void> showCustom(
      {required Widget ui, SmartDialogController? controller}) async {
    SmartDialog.show(
      controller: controller,
      maskColor: Colors.transparent,
      builder: (_) {
        return ui;
      },
    );
  }

  static Future<void> showImageDialog({String? path}) async {
    SmartDialog.show(
      maskColor: Colors.transparent,
      builder: (_) {
        return Card(
          elevation: 10,
          child: Container(
              width: 500,
              height: 500,
              alignment: Alignment.topRight,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(path!), fit: BoxFit.fill)),
              child: Transform.translate(
                offset: const Offset(30, -30),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    color: Colors.white,
                    highlightColor: Colors.white,
                    padding: EdgeInsets.zero,
                    icon: const CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 40,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                    onPressed: () {
                      CustomDialog.dismiss();
                    },
                  ),
                ),
              )),
        );
      },
    );
  }
}
