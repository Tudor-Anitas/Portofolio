import 'package:flutter/cupertino.dart';
import 'package:portofolio/breakpoints.dart';


class ResponsiveLayout extends StatelessWidget{

  final Widget mobileBody;
  final Widget tabletBody;
  final Widget desktopBody;

  const ResponsiveLayout({
    Key? key, 
    required this.mobileBody, 
    required this.tabletBody, 
    required this.desktopBody
    }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, dimensions){
          if(dimensions.maxWidth < kTABLET_BREAKPOINT){
            return mobileBody;
          } else if(dimensions.maxWidth >= kTABLET_BREAKPOINT && dimensions.maxWidth < kDESKTOP_BREAKPOINT){
            return tabletBody;
          } else{
            return desktopBody;
          }
        }
      );
  }

}