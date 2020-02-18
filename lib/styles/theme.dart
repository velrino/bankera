import 'dart:ui';
import 'package:flutter/cupertino.dart';

class Colors {

  const Colors();

  static const Color primary = const Color(0xffeea849);
  static const Color secondary = const Color(0xffec7000);

  static const primaryGradient = const LinearGradient(
    colors: const [primary, secondary],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}