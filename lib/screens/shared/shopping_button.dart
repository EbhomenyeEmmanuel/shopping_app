import 'package:flutter/material.dart';

import '../palette.dart';

class ShoppingButton extends StatelessWidget {
  final String _buttonText;
  final Function _onPressed;

  const ShoppingButton({
    Key? key,
    required String buttonText,
    required Function onPressed,
  })  : _buttonText = buttonText,
        _onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return MaterialButton(
      padding: const EdgeInsets.all(16),
      minWidth: screenSize.width,
      color: Palette.primaryColor,
      onPressed: () => _onPressed(),
      textColor: Colors.white,
      child: Text(_buttonText),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.0),
      ),
    );
  }
}
