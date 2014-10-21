library dialog.prompt;

import "dart:html";
import "../src/dialog_class.dart";

String prompt(String message,[String value]){
Dialog promptDialog=new Dialog();
SpanElement span=new SpanElement();
span.text=message;
InputElement input=new InputElement();
input..value=value
     ..select();
ButtonElement cancel=new ButtonElement();
cancel..text="Cancel"
      ..onClick.listen((_){
      promptDialog.closeDialog();
      return null;
      });
promptDialog..content=[span,input,cancel]
            ..showDialog()
            ..okay.onClick.listen((_){
            return input.value;
            });
}