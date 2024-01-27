import 'package:flutter/material.dart';

void showSnackBarWithText(BuildContext context, String errorMsg) {
  //dismiss current snackbar first before showing another
  ScaffoldMessenger.of(context).removeCurrentSnackBar();

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 15,
      ),
      content: Text(errorMsg),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
