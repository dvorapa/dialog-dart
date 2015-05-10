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
    ..modalBackdrop.onClick.first.then((_) {
      c.complete(false);
      confirmDialog.closeDialog();
    })
    ..xButton.onClick.first.then((_) {
      c.complete(false);
      confirmDialog.closeDialog();
    })
    ..cancelButton.onClick.first.then((_) {
      c.complete(false);
      confirmDialog.closeDialog();
    })
    ..okButton.onClick.first.then((_) {
      c.complete(true);
      confirmDialog.closeDialog();
    });

  querySelectorAll("button").forEach((ButtonElement buttons) {
    buttons.onKeyDown.listen((e) {
      if (e is KeyboardEvent && e.keyCode == KeyCode.ESC) {
        c.complete(false);
        confirmDialog.closeDialog();
      }
    });
  });

  return c.future;
}
