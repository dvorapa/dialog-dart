library dialog.confirm;

import "dart:html";
import "../src/dialog_class.dart";

bool confirm([String message=""]){
Dialog confirmDialog=new Dialog([new Text(message)],"Confirm",true);
confirmDialog..showDialog()
             ..modalBackdrop.onClick.first.then((_)=>false).then((_)=>confirmDialog.closeDialog())
             ..xButton.onClick.first.then((_)=>false).then((_)=>confirmDialog.closeDialog())
             ..cancelButton.onClick.first.then((_)=>false).then((_)=>confirmDialog.closeDialog())
             ..okButton.onClick.first.then((_)=>true).then((_)=>confirmDialog.closeDialog());
}