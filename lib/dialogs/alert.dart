library dialog.alert;

import "dart:html";
import "../src/dialog_class.dart";

void alert([String message = ""]) {
  Dialog alertDialog = new Dialog([new Text(message)], "Alert");
  alertDialog
      ..showDialog()
      ..okButton.focus()
      ..modalBackdrop.onClick.first.then((_) => alertDialog.closeDialog())
      ..xButton.onClick.first.then((_) => alertDialog.closeDialog())
      ..okButton.onClick.first.then((_) => alertDialog.closeDialog());
}
