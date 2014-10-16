import "dart:html";
import "package:dialog/dialog.dart";

main(){
querySelector("#alertButton").onClick.listen((_){
  alert("Alerted?!");
});
querySelector("#confirmButton").onClick.listen((_){
  confirm("Confirmed?!");
});
querySelector("#promptButton").onClick.listen((_){
  prompt("Prompted?!","Yes!");
});
}