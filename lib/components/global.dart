import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Globals {
     static final ColorScheme globalColorScheme = ThemeData.light().colorScheme;
  static final logoImage = Container(
    clipBehavior: Clip.antiAlias,
    decoration:
        const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(12))),
    child: SvgPicture.asset('assets/logo.svg'),
  );
}
