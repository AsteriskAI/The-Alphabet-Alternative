import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:alphabetalternative/color_schemes.g.dart';

class Globals {
  static const ColorScheme globalColorScheme = ColorSchemes;
  static final logoImage = SvgPicture.asset('assets/logo.svg',height: double.infinity, width: double.infinity,fit: BoxFit.contain,alignment: Alignment.topCenter,);
}
