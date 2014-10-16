# Dialog.dart

Modern alert, confirm and prompt dialog implementation

## Description

This package replaces default alert and confirm dialogs from Dart's Window class and adds missing prompt dialog. Default system dialogs called by that prompts are superseded by modern modal design.

## Usage

Usage is almost the same as set in the Dart's Window class and completely the same as described in the WHATWG HTML Standard. For each dialog there is just one file to import only the dialog you really need. There is also one file to import all three dialogs at once if you want to use them all.

### alert.dart

Replaces default alert dialog.

```Dart
querySelector("#alertButton").onClick.listen((_){
  alert("Alerted?!");
});
```

![Image of alert]()

### confirm.dart

Replaces default confirm dialog.

```Dart
querySelector("#confirmButton").onClick.listen((_){
  confirm("Confirmed?!");
});
```

![Image of confirm]()

### prompt.dart

Adds missing prompt dialog.

```Dart
querySelector("#promptButton").onClick.listen((_){
  prompt("Prompted?!","Yes!");
});
```

![Image of prompt]()

### dialog.dart

Do you need to use them all at once? Try it by importing dialog.dart file.