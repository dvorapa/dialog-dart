import "dart:html";
import "package:dialog/dialog.dart";

main(){
querySelector("#alertButton").onClick.listen((_){alert("Alerted?!");});
querySelector("#confirmButton").onClick.listen((_){
var myConfirm=confirm("Confirmed?!");
alert(myConfirm.toString());
});
querySelector("#promptButton").onClick.listen((_){
var myPrompt=prompt("Prompted?!","Yes!");
alert(myPrompt.toString());
});
}