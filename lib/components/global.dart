import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:alphabetalternative/color_schemes.g.dart';

class Globals {
     static final ColorScheme globalColorScheme = ColorSchemes;
  static final logoImage = Container(
    clipBehavior: Clip.antiAlias,
    decoration:
        const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(12))),
    child: SvgPicture.asset('assets/logo.svg', fit: BoxFit.contain,),
  );
}
