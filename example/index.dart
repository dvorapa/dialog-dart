import "dart:html";
import "package:dialog/dialog.dart";

main() {
  querySelector("#alertButton").onClick.listen((_) {
    alert("Alerted?!");
  });
  querySelector("#confirmButton").onClick.listen((_) async {
    var myConfirm = await confirm("Confirmed?!");
    alert(myConfirm.toString());
  });
  querySelector("#promptButton").onClick.listen((_) async {
    var myPrompt = await prompt("Prompted?!", "Yes!");
    alert(myPrompt.toString());
  });
  querySelector("#modalButton").onClick.listen((_) async {
    var myModal = await modal(
        "Surprise", [Text("Boo!")], "Eek!", "Huh?", "Haha!", "Come on!", true);
    alert(myModal.toString());
  });
}
