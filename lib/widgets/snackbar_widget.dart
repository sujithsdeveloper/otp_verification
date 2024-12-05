
  import 'package:flutter/material.dart';

SnackBar customSnackBar({required String label}) {
    return SnackBar(
              backgroundColor: Colors.black,
              content: Text(
               label,
                style: TextStyle(color: Colors.white),
              ));
  }