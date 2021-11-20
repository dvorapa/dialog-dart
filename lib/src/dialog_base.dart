library dialog.src.dialog_base;

import "dart:html";

class Dialog {
  String title;
  List<Node> content;
  String? successText;
  String? cancelText;
  bool? cancellable;
  final DivElement dialog = DivElement();
  final DivElement dialogBackdrop = DivElement();
  final ButtonElement xButton = ButtonElement();
  final ButtonElement cancelButton = ButtonElement();
  final ButtonElement okButton = ButtonElement();

  Dialog(this.title, this.content,
      [this.cancellable = false,
      this.successText = "OK",
      this.cancelText = "Cancel"]) {
    if (document.querySelector("body")!.style.color != "rgb(51, 51, 51)" &&
        querySelectorAll("[href*='packages/dialog/bootstrap.css']").isEmpty) {
      LinkElement link = LinkElement()
        ..href = "packages/dialog/bootstrap.css"
        ..rel = "stylesheet"
        ..type = "text/css";
      document.querySelector("head")!.insertAdjacentElement("beforeEnd", link);
    }

    dialog
      ..classes.addAll(["modal", "fade"])
      ..style.display = "block";
    dialogBackdrop
      ..classes.addAll(["modal-backdrop", "fade"])
      ..style.zIndex = "auto";
    dialog.children.add(dialogBackdrop);
    DivElement dialogModal = DivElement()
      ..classes.addAll(["modal-dialog", "modal-sm"]);
    dialog.children.add(dialogModal);
    DivElement dialogContent = DivElement()..classes.add("modal-content");
    dialogModal.children.add(dialogContent);

    DivElement dialogHeader = DivElement()
      ..classes.add("modal-header")
      ..style.border = "0";
    HeadingElement dialogTitle = HeadingElement.h5()
      ..classes.add("modal-title")
      ..text = title;
    dialogHeader.children.add(dialogTitle);
    xButton
      ..classes.add("close")
      ..text = String.fromCharCode(215);
    dialogHeader.children.add(xButton);
    dialogContent.children.add(dialogHeader);

    DivElement dialogBody = DivElement()
      ..classes.add("modal-body")
      ..nodes.addAll(content)
      ..style.paddingBottom = "0"
      ..style.paddingTop = "0";
    dialogContent.children.add(dialogBody);

    DivElement dialogFooter = DivElement()
      ..classes.add("modal-footer")
      ..style.border = "0";
    if (cancellable == true) {
      cancelButton
        ..classes.addAll(["btn", "btn-secondary"])
        ..text = cancelText;
      dialogFooter.children.add(cancelButton);
    }
    okButton
      ..classes.addAll(["btn", "btn-primary"])
      ..text = successText;
    dialogFooter.children.add(okButton);
    dialogContent.children.add(dialogFooter);
  }

  void showDialog() {
    if (document.body!.classes.contains("modal-open") == false) {
      document.body!.children.add(dialog);
      dialogBackdrop.classes.add("show");
      dialog.classes.add("show");
      document.body!.classes.add("modal-open");
    }
  }

  void closeDialog() {
    if (document.body!.classes.contains("modal-open") == true) {
      document.body!
        ..children.remove(dialog)
        ..children.remove(dialogBackdrop)
        ..classes.remove("modal-open");
    }
  }
}
