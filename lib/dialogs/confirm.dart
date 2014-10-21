library dialog.confirm;

import "dart:html";
import "../src/dialog_class.dart";

bool confirm(String message){
Dialog confirmDialog=new Dialog();
SpanElement span=new SpanElement();
span.text=message;
ButtonElement cancel=new ButtonElement();
cancel..text="Cancel"
      ..onClick.listen((_){
      confirmDialog.closeDialog();
      return false;
      });
confirmDialog..content=[span,cancel]
             ..showDialog()
             ..okay.onClick.listen((_){
             return true;
             });
}