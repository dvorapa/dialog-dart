import "dart:html";

class Dialog{
DialogElement dialog;
AnchorElement closeButton;
ButtonElement okay;
ElementList content;

Dialog(){

dialog=new DialogElement();

if((querySelectorAll("[href*=bootstrap.min.css]").length==0)&&(querySelectorAll("[href*=bootstrap.css]").length==0)){
LinkElement link=new LinkElement();
link..type="text/css"
    ..href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css";
queryElement("Head").insertAdjacentElement("beforeEnd",link);
}

closeButton=new AnchorElement();
closeButton..text="&times;"
     ..onClick.listen((_){
     this.closeDialog();
     });
closeButton.style..color="black"
           ..float="right"
           ..textDecoration="none";

okay=new ButtonElement();
okay..text="Okay"
    ..onClick.listen((_){
    this.closeDialog();
    });
okay.style..backgroundColor="blue"
          ..border="0"
          ..borderRadius="0,25em"
          ..color="white;";

content..add(okay)
       ..forEach((Element element){
       element.style.zIndex="1060";
       dialog.insertAdjacentElement("afterBegin",element);
       });

dialog.style..backgroundColor="white"
            ..borderRadius="0.375em"
            ..color="black"
            ..display="none"
            ..margin="auto"
            ..position="fixed"
            ..zIndex="1050"
            ..top="0"
            ..left="0"
            ..bottom="0"
            ..right="0";
}

bool showDialog(){
if(document.body.classes.contains("opennedDialog")){
return false;
}else{
dialog.show();
document.body.classes.add("opennedDialog");
return true;
}
}

bool closeDialog(){
if(document.body.classes.contains("opennedDialog")){
dialog.close("");
document.body.classes.remove("opennedDialog");
return true;
}else{
return false;
}
}
}
