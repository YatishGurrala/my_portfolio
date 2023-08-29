
import 'package:flutter/material.dart';

class Responsive extends StatelessWidget{
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  }) :super(key: key);

// in case we need to detect the screen size without building the UI.
  static bool isMobile(BuildContext context) =>
  MediaQuery.of(context).size.width < 650;

  static bool isTablet(BuildContext context) =>
  MediaQuery.of(context).size.width < 1100 && 
  MediaQuery.of(context).size.width >= 650;

  static bool isDesktop(BuildContext context) =>
  MediaQuery.of(context).size.width >=1100;

// if the maxWidth is bigger than 1100 pixels, we will build for the desktop, otherwise, 
//if it is smaller than that but bigger than 650 pixels, we build for tablet, otherwise mobile.
  @override
  Widget build(BuildContext context){
    return LayoutBuilder(
      builder: (context,constraints){
        if(constraints.maxWidth >=1100){
          return desktop;
        }else if(constraints.maxWidth >= 650){
          return tablet;
        }
        else{
          return mobile;
        }
      },
      );
  }
}