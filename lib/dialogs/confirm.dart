library dialog.confirm;

import "dart:async";
import "dart:html";
import "../src/dialog_class.dart";

Future<dynamic> confirm([String message = ""]) async {
  Completer c = Completer();
  Dialog confirmDialog = Dialog([Text(message)], "Confirm", true);

  confirmDialog
    ..showDialog()
    ..okButton.focus()
    ..dialogBackdrop.onClick.first.then((_) {
      c.complete(false);
      confirmDialog.closeDialog();
    });

  querySelectorAll(".modal button").forEach((Element buttons) {
    buttons.onClick.first.then((e) {
      if (e.target == confirmDialog.okButton) {
        c.complete(true);
      } else {
        c.complete(false);
      }
      confirmDialog.closeDialog();
    });
    buttons.onKeyDown.listen((e) {
      if (e.keyCode == KeyCode.ESC) {
        c.complete(false);
        confirmDialog.closeDialog();
      }
    });
  });

  return c.future;
}
