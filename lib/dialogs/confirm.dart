library dialog.confirm;

import "dart:async";
import "dart:html";
import "../src/dialog_class.dart";

Future<bool> confirm([String message = ""]) async {
  Completer c = new Completer();
  Dialog confirmDialog = new Dialog([new Text(message)], "Confirm", true);

  confirmDialog
    ..showDialog()
    ..okButton.focus()
    ..dialogBackdrop.onClick.first.then((_) {
      c.complete(false);
      confirmDialog.closeDialog();
    });

  querySelectorAll(".modal button").forEach((ButtonElement buttons) {
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
