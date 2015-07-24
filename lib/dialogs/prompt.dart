library dialog.prompt;

import "dart:async";
import "dart:html";
import "../src/dialog_class.dart";

Future<String> prompt([String message = "", String value = ""]) async {
  Completer c = new Completer();

  LabelElement label = new LabelElement()
    ..classes.add("control-label")
    ..htmlFor = "dialogInput"
    ..text = message;
  BRElement br = new BRElement();
  InputElement input = new InputElement(type: "text")
    ..classes.add("form-control")
    ..id = "dialogInput"
    ..value = value;

  Dialog promptDialog = new Dialog([label, br, input], "Prompt", true);

  promptDialog.showDialog();
  input.focus();

  promptDialog.dialogBackdrop.onClick.first.then((_) {
    c.complete(null);
    promptDialog.closeDialog();
  });

  querySelectorAll(".modal button").forEach((ButtonElement buttons) {
    buttons.onClick.first.then((e) {
      if (e.target == promptDialog.okButton) {
        c.complete(input.value);
      } else {
        c.complete(null);
      }
      promptDialog.closeDialog();
    });
    buttons.onKeyDown.listen((e) {
      if (e.keyCode == KeyCode.ESC) {
        c.complete(null);
        promptDialog.closeDialog();
      }
    });
  });

  input.onKeyDown.listen((e) {
    if (e.keyCode == KeyCode.ENTER) {
      e.preventDefault();
      c.complete(input.value);
      promptDialog.closeDialog();
    } else if (e.keyCode == KeyCode.ESC) {
      c.complete(null);
      promptDialog.closeDialog();
    }
  });

  return c.future;
}
