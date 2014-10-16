library dialog.prompt;

import "dart:html";
import "../src/dialog_class.dart";

String prompt(String message,[String default]){
Dialog promptDialog=new Dialog();
InputElement input=new InputElement();
input..value=default
     ..select();
ButtonElement cancel=new ButtonElement();
cancel..text="Cancel"
      ..onClick.listen((_){
      promptDialog.hideDialog();
      return null;
      });
promptDialog..content=message+input+cancel
            ..showDialog()
            ..okay.onClick.listen((){
            return input.value;
            });
}