import 'dart:ui';
import 'package:flutter/cupertino.dart';

class Colors {

  const Colors();

  static const Color primary = const Color(0xff045499);
  static const Color secondary = const Color(0xff08be73);

  static const primaryGradient = const LinearGradient(
    colors: const [primary, secondary],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}