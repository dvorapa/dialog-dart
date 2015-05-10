library dialog.prompt;

import "dart:async";
import "dart:html";
import "../src/dialog_class.dart";

Future<String> prompt([String message = "", String value = ""]) async {
  Completer c = new Completer();

  LabelElement label = new LabelElement()
    ..classes.add("control-label")
    ..htmlFor = "TextInputInDialog"
    ..text = message;
  BRElement br = new BRElement();
  InputElement input = new InputElement(type: "text")
    ..classes.add("form-control")
    ..id = "TextInputInDialog"
    ..value = value;

  Dialog promptDialog = new Dialog([label, br, input], "Prompt", true);

  promptDialog.showDialog();
  input.focus();

  promptDialog
    ..modalBackdrop.onClick.first.then((_) {
      c.complete(null);
      promptDialog.closeDialog();
    })
    ..xButton.onClick.first.then((_) {
      c.complete(null);
      promptDialog.closeDialog();
    })
    ..cancelButton.onClick.first.then((_) {
      c.complete(null);
      promptDialog.closeDialog();
    })
    ..okButton.onClick.first.then((_) {
      c.complete(input.value);
      promptDialog.closeDialog();
    });

  querySelectorAll("button").forEach((ButtonElement buttons) {
    buttons.onKeyDown.listen((e) {
      if (e is KeyboardEvent && e.keyCode == KeyCode.ESC) {
        c.complete(null);
        promptDialog.closeDialog();
      }
    });
  });
  querySelectorAll("input").forEach((InputElement inputs) {
    inputs.onKeyDown.listen((e) {
      if (e is KeyboardEvent && e.keyCode == KeyCode.ESC) {
        c.complete(null);
        promptDialog.closeDialog();
      } else if (e is KeyboardEvent && e.keyCode == KeyCode.ENTER) {
        c.complete(input.value);
        promptDialog.closeDialog();
      }
    });
  });

  return c.future;
}
