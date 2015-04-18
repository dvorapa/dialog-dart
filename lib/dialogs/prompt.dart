library dialog.prompt;

import "dart:html";
import "../src/dialog_class.dart";

String prompt([String message = "", String value = ""]) {
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
  promptDialog
    ..showDialog()
    ..modalBackdrop.onClick.first
        .then((_) => null)
        .then((_) => promptDialog.closeDialog())
    ..xButton.onClick.first
        .then((_) => null)
        .then((_) => promptDialog.closeDialog())
    ..cancelButton.onClick.first
        .then((_) => null)
        .then((_) => promptDialog.closeDialog())
    ..okButton.onClick.first
        .then((_) => input.value)
        .then((_) => promptDialog.closeDialog());
  input.focus();
}
