library dialog.alert;

import "dart:html";
import "../src/dialog_base.dart";

void alert([String message = ""]) {
  Dialog alertDialog = Dialog("Alert", [Text(message)]);

  alertDialog
    ..showDialog()
    ..okButton.focus()
    ..dialogBackdrop.onClick.first.then((_) => alertDialog.closeDialog());

  querySelectorAll(".modal button").forEach((Element buttons) {
    buttons.onClick.first.then((e) => alertDialog.closeDialog());
    buttons.onKeyDown.listen((e) {
      if (e.keyCode == KeyCode.ESC) {
        alertDialog.closeDialog();
      }
    });
  });
}
