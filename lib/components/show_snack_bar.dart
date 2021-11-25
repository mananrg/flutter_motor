import 'package:flutter/material.dart';

class show_snack_bar extends StatelessWidget {
final String text;
  show_snack_bar({required this.text});

  // TODO: connect show_snackbar to signup
  @override
  Widget build(BuildContext context) {
    return SnackBar(
        content:  Text(text),
    duration: const Duration(seconds: 10),
    action: SnackBarAction(
    label: 'Click',
    onPressed: () {
    print('Action is clicked');
    },
    textColor: Colors.white,
    disabledTextColor: Colors.grey,
    ));
  }
}
