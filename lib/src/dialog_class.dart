import "dart:html";

class Dialog {
  List<Node> content;
  String title;
  bool cancelable;
  String cancelName;
  String okName;
  DivElement dialog = new DivElement();
  DivElement modalBackdrop = new DivElement();
  ButtonElement xButton = new ButtonElement();
  ButtonElement cancelButton = new ButtonElement();
  ButtonElement okButton = new ButtonElement();

  Dialog(this.content, this.title, [this.cancelable = false,
      this.cancelName = "Cancel", this.okName = "OK"]) {
    if (querySelectorAll(
        "[href*='//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css']").isEmpty) {
      LinkElement link = new LinkElement()
        ..href =
        "//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"
        ..rel = "stylesheet"
        ..type = "text/css";
      document.querySelector("head").insertAdjacentElement("beforeEnd", link);
    }

    dialog.classes.add("modal fade");
    modalBackdrop..classes.add("modal-backdrop fade");
    dialog.children.add(modalBackdrop);
    DivElement modalDialog = new DivElement()
      ..classes.add("modal-dialog modal-sm");
    dialog.children.add(modalDialog);
    DivElement modalContent = new DivElement()..classes.add("modal-content");
    modalDialog.children.add(modalContent);

    DivElement modalHeader = new DivElement()
      ..classes.add("modal-header")
      ..style.border = "0";

    xButton
      ..classes.add("close")
      ..text = new String.fromCharCode(215);
    modalHeader.children.add(xButton);

    HeadingElement modalTitle = new HeadingElement.h4()
      ..classes.add("modal-title")
      ..text = title;
    modalHeader.children.add(modalTitle);

    modalContent.children.add(modalHeader);

    DivElement modalBody = new DivElement()
      ..classes.add("modal-body")
      ..nodes.addAll(content)
      ..style.paddingBottom = "0"
      ..style.paddingTop = "0";

    modalContent.children.add(modalBody);

    DivElement modalFooter = new DivElement()
      ..classes.add("modal-footer")
      ..style.border = "0";

    if (cancelable == true) {
      cancelButton
        ..classes.add("btn btn-default")
        ..text = cancelName;
      modalFooter.children.add(cancelButton);
    }

    okButton
      ..classes.add("btn btn-primary")
      ..text = okName;
    modalFooter.children.add(okButton);

    modalContent.children.add(modalFooter);

    document.body.children.add(dialog);
  }

  void showDialog() {
    if (!(document.body.classes.contains("opennedDialog"))) {
      dialog
        ..classes.add("in")
        ..style.display = "block";
      modalBackdrop
        ..classes.add("in")
        ..style.height = "100%";
      document.body.classes.add("opennedDialog");
    }
  }

  void closeDialog() {
    if (document.body.classes.contains("opennedDialog")) {
      dialog.style.display = "none";
      modalBackdrop.style.display = "none";
      document.body.classes.remove("opennedDialog");
    }
  }
}
