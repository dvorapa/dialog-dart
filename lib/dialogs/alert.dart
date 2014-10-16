library dialog.alert;

import "../src/dialog_class.dart";

void alert(String message){
Dialog alertDialog=new Dialog();
alertDialog..content=message
           ..showDialog();
}