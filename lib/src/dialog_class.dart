library dialog.src.dialog_class;

import "dart:html";

class Dialog {
  List<Node> content;
  String title;
  bool cancelable;
  String cancelName;
  String okName;
  DivElement dialog = new DivElement();
  DivElement dialogBackdrop = new DivElement();
  ButtonElement xButton = new ButtonElement();
  ButtonElement cancelButton = new ButtonElement();
  ButtonElement okButton = new ButtonElement();

  Dialog(this.content, this.title, [this.cancelable = false,
      this.cancelName = "Cancel", this.okName = "OK"]) {
    if (querySelectorAll(
        "[href*='//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css']").isEmpty) {
      LinkElement link = new LinkElement()
        ..href =
        "//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"
        ..rel = "stylesheet"
        ..type = "text/css";
      document.querySelector("head").insertAdjacentElement("beforeEnd", link);
    }

    dialog
      ..classes.addAll(["modal", "fade"])
      ..style.display = "block";
    dialogBackdrop
      ..classes.addAll(["modal-backdrop", "fade"])
      ..style.zIndex = "auto";
    dialog.children.add(dialogBackdrop);
    DivElement dialogModal = new DivElement()
      ..classes.addAll(["modal-dialog", "modal-sm"]);
    dialog.children.add(dialogModal);
    DivElement dialogContent = new DivElement()..classes.add("modal-content");
    dialogModal.children.add(dialogContent);

    DivElement dialogHeader = new DivElement()
      ..classes.add("modal-header")
      ..style.border = "0";
    xButton
      ..classes.add("close")
      ..text = new String.fromCharCode(215);
    dialogHeader.children.add(xButton);
    HeadingElement dialogTitle = new HeadingElement.h4()
      ..classes.add("modal-title")
      ..text = title;
    dialogHeader.children.add(dialogTitle);
    dialogContent.children.add(dialogHeader);

    DivElement dialogBody = new DivElement()
      ..classes.add("modal-body")
      ..nodes.addAll(content)
      ..style.paddingBottom = "0"
      ..style.paddingTop = "0";
    dialogContent.children.add(dialogBody);

    DivElement dialogFooter = new DivElement()
      ..classes.add("modal-footer")
      ..style.border = "0";
    if (cancelable == true) {
      cancelButton
        ..classes.addAll(["btn", "btn-default"])
        ..text = cancelName;
      dialogFooter.children.add(cancelButton);
    }
    okButton
      ..classes.addAll(["btn", "btn-primary"])
      ..text = okName;
    dialogFooter.children.add(okButton);
    dialogContent.children.add(dialogFooter);
  }

  void showDialog() {
    if (document.body.classes.contains("modal-open") == false) {
      document.body.children.add(dialog);
      dialogBackdrop..classes.add("in");
      dialog..classes.add("in");
      document.body.classes.add("modal-open");
    }
  }

  void closeDialog() {
    if (document.body.classes.contains("modal-open") == true) {
      document.body
        ..children.remove(dialog)
        ..children.remove(dialogBackdrop)
        ..classes.remove("modal-open");
    }
  }
}
