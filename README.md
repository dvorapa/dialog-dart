# Dialog.dart

Modern modal dialog implementation containing remakes of alert & confirm dialogs supplemented by prompt & custom modal dialogs

## Description

This package replaces default alert & confirm dialogs from Dart's Window class and adds missing prompt & custom modal dialogs. Default system dialogs called by that prompts are superseded by modern modal design.

## Usage

Usage is almost the same as set in the Dart's Window class and completely the same as described in the WHATWG HTML Standard. For each dialog there is just one file to import only the dialog you really need. There is also one file to import all four dialogs at once if you want to use them all.

```Dart
import "package:dialog/~file~";
```

### Libraries to import in `~file~`:

#### dialogs/alert.dart

Replaces default alert dialog.

```Dart
querySelector("#alertButton").onClick.listen((_) {
  alert("Alerted?!");
});
```

![Image of alert](https://raw.githubusercontent.com/dvorapa/dialog-dart/master/alert.png)

#### dialogs/confirm.dart

Replaces default confirm dialog.

```Dart
querySelector("#confirmButton").onClick.listen((_) async {
  var myConfirm = await confirm("Confirmed?!");
  alert(myConfirm.toString());
});
```

![Image of confirm](https://raw.githubusercontent.com/dvorapa/dialog-dart/master/confirm.png)

#### dialogs/prompt.dart

Adds missing prompt dialog.

```Dart
querySelector("#promptButton").onClick.listen((_) async {
  var myPrompt = await prompt("Prompted?!", "Yes!");
  alert(myPrompt.toString());
});
```

![Image of prompt](https://raw.githubusercontent.com/dvorapa/dialog-dart/master/prompt.png)

#### dialogs/modal.dart

Adds fully customizable modal dialog.

```Dart
querySelector("#modalButton").onClick.listen((_) async {
  var myModal = await modal(
      "Surprise", [Text("Boo!")], "Eek!", "Huh?", "Haha!", "Come on!", true);
  alert(myModal.toString());
});
```

![Image of modal](https://raw.githubusercontent.com/dvorapa/dialog-dart/master/modal.png)

#### dialog.dart

Do you need to use them all at once? Try to import dialog.dart file only!

## Contributing

Please fill in an issue or a pull request on project's [GitHub page](https://github.com/dvorapa/dialog-dart).

You might want to buy me a [beer 🍺](https://paypal.me/dvorapa) or a [coffee ☕](https://paypal.me/dvorapa).

## License

[The BSD 2-Clause License](https://github.com/dvorapa/dialog-dart/blob/master/LICENSE)
