import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:alphabetalternative/color_schemes.g.dart';

class Globals {
  static int currentplayer = 1;
  static String cardclicked = '';
  static int numberOfPlayers = 2;
  static const ColorScheme globalColorScheme = ColorSchemes;
  static final ruleimage = Image.asset('assets/rule.png', height: 350, width: 300,  alignment: Alignment.topCenter,);
  static final logoImage = SvgPicture.asset('assets/logo.svg',height: double.infinity, width: double.infinity,fit: BoxFit.contain,alignment: Alignment.topCenter,);
}
