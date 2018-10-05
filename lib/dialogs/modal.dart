library dialog.modal;

import "dart:async";
import "dart:html";
import "../src/dialog_class.dart";

Future<dynamic> modal(
    [String title = "Modal",
    List<Node> content = const [],
    String successText,
    String cancelText,
    dynamic onSuccess,
    dynamic onCancel,
    bool cancellable,
    Element whatToFocus]) async {
  Completer c = Completer();

  Dialog modalDialog = Dialog(title, content, cancellable, successText,
      cancelText, onSuccess, onCancel);

  whatToFocus ??= modalDialog.okButton;

  modalDialog.showDialog();
  whatToFocus.focus();

  whatToReturn(bool howClosed) {
    if (howClosed == true) {
      c.complete(onSuccess);
    } else if (howClosed == false) {
      c.complete(onCancel);
    }
  }

  modalDialog.dialogBackdrop.onClick.first.then((_) {
    whatToReturn(false);
    modalDialog.closeDialog();
  });

  querySelectorAll(".modal button").forEach((Element buttons) {
    buttons.onClick.first.then((e) {
      if (e.target == modalDialog.okButton) {
        whatToReturn(true);
      } else {
        whatToReturn(false);
      }
      modalDialog.closeDialog();
    });
    buttons.onKeyDown.listen((e) {
      if (e.keyCode == KeyCode.ESC) {
        whatToReturn(false);
        modalDialog.closeDialog();
      }
    });
  });

  return c.future;
}
