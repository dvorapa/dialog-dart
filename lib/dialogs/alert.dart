library dialog.alert;

import "dart:html";
import "../src/dialog_class.dart";

void alert(String message){
Dialog alertDialog=new Dialog();
SpanElement span=new SpanElement();
span.text=message;
alertDialog..content=[span]
           ..showDialog();
}