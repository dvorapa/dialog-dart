library dialog.prompt;

import "dart:async";
import "dart:html";
import "../src/dialog_class.dart";

Future<dynamic> prompt([String message = "", String value = ""]) async {
  Completer c = Completer();

  LabelElement label = LabelElement()
    ..classes.add("control-label")
    ..htmlFor = "dialogInput"
    ..text = message;
  InputElement input = InputElement(type: "text")
    ..classes.add("form-control")
    ..id = "dialogInput"
    ..value = value;

  Dialog promptDialog = Dialog("Prompt", [label, input], true);

  promptDialog.showDialog();
  input.focus();

  await promptDialog.dialogBackdrop.onClick.first.then((_) {
    c.complete(null);
    promptDialog.closeDialog();
  });

  querySelectorAll(".modal button").forEach((Element buttons) {
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
