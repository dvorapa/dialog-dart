library dialog.confirm;

import "dart:html";
import "../src/dialog_class.dart";

bool confirm(String message){
Dialog confirmDialog=new Dialog();
ButtonElement cancel=new ButtonElement();
cancel..text="Cancel"
      ..onClick.listen((_){
      confirmDialog.hideDialog();
      return false;
      });
confirmDialog..content=message+cancel
             ..showDialog()
             ..okay.onClick.listen((){
             return true;
             });
}