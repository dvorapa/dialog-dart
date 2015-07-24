library dialog.alert;

import "dart:html";
import "../src/dialog_class.dart";

void alert([String message = ""]) {
  Dialog alertDialog = new Dialog([new Text(message)], "Alert");

  alertDialog
    ..showDialog()
    ..okButton.focus()
    ..dialogBackdrop.onClick.first.then((_) => alertDialog.closeDialog());

  querySelectorAll(".modal button").forEach((ButtonElement buttons) {
    buttons.onClick.first.then((e) => alertDialog.closeDialog());
    buttons.onKeyDown.listen((e) {
      if (e.keyCode == KeyCode.ESC) {
        alertDialog.closeDialog();
      }
    });
  });
}
