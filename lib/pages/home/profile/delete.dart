import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nofapper/constants/colors.dart';
import 'package:nofapper/constants/constants.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showAlertDialog(context);
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
        child: Text("Delete Account", style: GoogleFonts.patrickHand(color: color2, fontSize: 16, fontWeight: FontWeight.bold),),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          border: Border.all(width: 0.5),
          color: color13,
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  Widget cancelButton = TextButton(
    child: const Text("Cancel"),
    onPressed:  () {
      Navigator.of(context).pop();
    },
  );
  Widget yesButton = TextButton(
    child: const Text("Yes"),
    onPressed:  () async {
      Navigator.of(context).pop();
      await notificationsPlugin.cancelAll();
      authController.delete();
    },
  );
  AlertDialog alert = AlertDialog(
    title: Text("WARNING", style: GoogleFonts.patrickHand(fontSize: 20, fontWeight: FontWeight.bold),),
    content: const Text("Your account will be permanently deleted with no option to recover."),
    actions: [
      cancelButton,
      yesButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
    barrierDismissible: false,
  );
}
