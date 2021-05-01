import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portofolio/colors.dart';
import 'package:portofolio/custom_input.dart';
import 'package:portofolio/database.dart';
import 'dart:math';

import '../mouse.dart';

class MobileBody extends StatefulWidget {
  @override
  _MobileBodyState createState() => _MobileBodyState();
}

class _MobileBodyState extends State<MobileBody> with TickerProviderStateMixin {

  late AnimationController shakeAndroidController;
  late Animation<double> shakeAndroidAnimation;
  late AnimationController shakeFirebaseController;
  late Animation<double> shakeFirebaseAnimation;
  late AnimationController shakeJavaController;
  late Animation<double> shakeJavaAnimation;
  late AnimationController pointerSizeController;
  late Animation<double> pointerAnimation;

  ScrollController scrollController = ScrollController();

  bool isBloodlineHovering = false;
  bool isTFTHovering = false;
  bool isPgcHovering = false;
  bool isGolfSkinsHovering = false;
  bool isInventoryHovering = false;
  bool isExchangeHovering = false;
  bool isSendButtonHovering = false;
  bool isScrollCreated = false;

  Offset pointerOffset = Offset(0, 0);

  @override
  void initState() {
    super.initState();

    // the animation controller for the icons
    shakeAndroidController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),

    );
    // updates the view for the animation to be visible
    shakeAndroidController.addListener(() {
      setState(() {});
    });
    // a tween that applies a curve and sets the limits of the animation
    shakeAndroidAnimation = Tween<double>(
        begin: 0.0,
        end: pi*2 + 0.3
    ).animate(new CurvedAnimation(
        parent: shakeAndroidController,
        curve: Curves.easeInOutQuint
    )
    );

    shakeFirebaseController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 700)
    );
    shakeFirebaseController.addListener(() {setState(() {});});
    shakeFirebaseAnimation = Tween<double>(
        begin: -0.3,
        end: 0.5
    ).animate(new CurvedAnimation(parent: shakeFirebaseController, curve: Curves.easeInOutBack));

    shakeJavaController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    shakeJavaController.addListener(() {setState(() {});});
    shakeJavaAnimation = Tween<double>(
        begin: 0,
        end: 20
    ).animate(new CurvedAnimation(parent: shakeJavaController, curve: Curves.easeOutCubic));

    pointerSizeController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    pointerAnimation = CurvedAnimation(
        curve: Curves.easeInOutCubic,
        parent: Tween<double>(begin: 0, end: 1).animate(pointerSizeController)
    );

    // check if the widget tree has been build
    // and if the scroll controller is attached
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      if(scrollController.hasClients)
        isScrollCreated = true;
    });
  }



  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;

    TextEditingController email = TextEditingController();
    TextEditingController subject = TextEditingController();
    TextEditingController message = TextEditingController();

    Dialog bloodlineDialog = Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: windowWidth * 0.05, vertical: windowHeight * 0.05),
      backgroundColor: Colors.grey[800],
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),),
        width: windowWidth,
        height: windowHeight,
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                  width: windowWidth,
                  height: windowHeight,
                  child: CarouselSlider(
                    items: [
                      Container(
                        width: windowWidth,
                        height: windowHeight,
                        margin: EdgeInsets.symmetric(horizontal: 0.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                              image: AssetImage('bloodlineLoginPortret.jpg'),
                              scale: 3.0
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                              image: AssetImage('bloodlineRegisterPortret.jpg')
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                              image: AssetImage('bloodlineMainPortret.jpg')
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                              image: AssetImage('bloodlinePostPortret.jpg')
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                              image: AssetImage('bloodlineMenuPortret.jpg')
                          ),
                        ),
                      ),
                    ],
                    options: CarouselOptions(
                        enlargeCenterPage: true,
                        height: windowHeight * 0.7,
                        aspectRatio: 5/16
                    ),
                  )
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 150,
                      height: 50,
                      margin: EdgeInsets.only(right: 20, bottom: 10),
                      child: MaterialButton(
                        onPressed: () { Navigator.pop(context);},
                        color: Colors.blue,
                        hoverColor: Colors.red[800],
                        textColor: Colors.white,
                        child: Text('Close', style: GoogleFonts.raleway(fontSize: 16, fontWeight: FontWeight.bold,)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
    Dialog tftDialog = Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: windowWidth * 0.1, vertical: windowHeight * 0.05),
      backgroundColor: Colors.grey[800],
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                  width: windowWidth,
                  height: windowHeight,
                  child: CarouselSlider(
                    items: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                              image: AssetImage('tftMainPortret.jpg')
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                              image: AssetImage('tftSearchPortret.jpg')
                          ),
                        ),
                      ),

                    ],
                    options: CarouselOptions(
                        enlargeCenterPage: true,
                        height: windowHeight * 0.7,
                        aspectRatio: 5/16
                    ),
                  )
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 150,
                      height: 50,
                      margin: EdgeInsets.only(right: 20, bottom: 10),
                      child: MaterialButton(
                        onPressed: () { Navigator.pop(context);},
                        color: Colors.blue,
                        hoverColor: Colors.red[800],
                        textColor: Colors.white,
                        child: Text('Close', style: GoogleFonts.raleway(fontSize: 16, fontWeight: FontWeight.bold,)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
    Dialog pgcDialog = Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: windowWidth * 0.1, vertical: windowHeight * 0.05),
      backgroundColor: Colors.grey[800],
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                  width: windowWidth,
                  height: windowHeight,
                  child: CarouselSlider(
                    items: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                              image: AssetImage('pgcMainPortret.jpg')
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                              image: AssetImage('pgcIngredientsPortret.jpg')
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                              image: AssetImage('pgcCondimentsPortret.jpg')
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                              image: AssetImage('pgcResultsPortret.jpg')
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                              image: AssetImage('pgcSettingsPortret.jpg')
                          ),
                        ),
                      ),

                    ],
                    options: CarouselOptions(
                        enlargeCenterPage: true,
                        height: windowHeight * 0.7,
                        aspectRatio: 5/16
                    ),
                  )
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 150,
                      height: 50,
                      margin: EdgeInsets.only(right: 20, bottom: 10),
                      child: MaterialButton(
                        onPressed: () { Navigator.pop(context);},
                        color: Colors.blue,
                        hoverColor: Colors.red[800],
                        textColor: Colors.white,
                        child: Text('Close', style: GoogleFonts.raleway(fontSize: 16, fontWeight: FontWeight.bold,)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
    Dialog golfDialog = Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: windowWidth * 0.1, vertical: windowHeight * 0.05),
      backgroundColor: Colors.grey[800],
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                  width: windowWidth,
                  height: windowHeight,
                  child: CarouselSlider(
                    items: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                              image: AssetImage('golfloginPortret.jpg')
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                              image: AssetImage('golfmainPortret.jpg')
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                              image: AssetImage('golfmatchesPortret.jpg')
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                              image: AssetImage('golfcreateMatchPortret.jpg')
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                              image: AssetImage('golfgamePortret.jpg')
                          ),
                        ),
                      ),

                    ],
                    options: CarouselOptions(
                        enlargeCenterPage: true,
                        height: windowHeight * 0.7,
                        aspectRatio: 5/16
                    ),
                  )
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 150,
                      height: 50,
                      margin: EdgeInsets.only(right: 20, bottom: 10),
                      child: MaterialButton(
                        onPressed: () { Navigator.pop(context);},
                        color: Colors.blue,
                        hoverColor: Colors.red[800],
                        textColor: Colors.white,
                        child: Text('Close', style: GoogleFonts.raleway(fontSize: 16, fontWeight: FontWeight.bold,)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
    Dialog inventoryDialog = Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: windowWidth * 0.1, vertical: windowHeight * 0.05),
      backgroundColor: Colors.grey[800],
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                  width: windowWidth,
                  height: windowHeight,
                  child: CarouselSlider(
                    items: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                              image: AssetImage('inventorymainPortret.jpg')
                          ),
                        ),
                      ),
                    ],
                    options: CarouselOptions(
                        enlargeCenterPage: true,
                        height: windowHeight * 0.7,
                        aspectRatio: 5/16
                    ),
                  )
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 150,
                      height: 50,
                      margin: EdgeInsets.only(right: 20, bottom: 10),
                      child: MaterialButton(
                        onPressed: () { Navigator.pop(context);},
                        color: Colors.blue,
                        hoverColor: Colors.red[800],
                        textColor: Colors.white,
                        child: Text('Close', style: GoogleFonts.raleway(fontSize: 16, fontWeight: FontWeight.bold,)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
    Dialog exchangeDialog = Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: windowWidth * 0.1, vertical: windowHeight * 0.05),
      backgroundColor: Colors.grey[800],
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                  width: windowWidth,
                  height: windowHeight,
                  child: CarouselSlider(
                    items: [

                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                              image: AssetImage('menuPortret.jpg')
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                              image: AssetImage('graphicPortret.jpg')
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                              image: AssetImage('listPortret.jpg')
                          ),
                        ),
                      ),
                    ],
                    options: CarouselOptions(
                        enlargeCenterPage: true,
                        height: windowHeight * 0.7,
                        aspectRatio: 5/16
                    ),
                  )
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 150,
                      height: 50,
                      margin: EdgeInsets.only(right: 20, bottom: 10),
                      child: MaterialButton(
                        onPressed: () { Navigator.pop(context);},
                        color: Colors.blue,
                        hoverColor: Colors.red[800],
                        textColor: Colors.white,
                        child: Text('Close', style: GoogleFonts.raleway(fontSize: 16, fontWeight: FontWeight.bold,)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

    return Container(
      color: kJET,
      child: ListView(
        scrollDirection: Axis.vertical,
        controller: scrollController,
        children: [
          // Name and contact button
          Container(
            width: windowWidth,
            height: windowHeight,
            child: Column(
              children: [
                Expanded(flex: 10, child: Container(),),
                // ------------------------- Headers
                Expanded(
                  flex: 20,
                  child: Container(
                      constraints: BoxConstraints(minHeight: 200),
                      child: Row(
                        children: [
                          Expanded(flex: 2, child: Container()),
                          // left side with text
                          Expanded(
                            flex: 48,
                            child: Container(
                                width: windowWidth,
                                child: Column(
                                  children: [
                                    Container(
                                        width: windowWidth,
                                        child: DefaultTextStyle(
                                          style: GoogleFonts.raleway(fontSize: 36, color: Colors.white, fontWeight: FontWeight.bold,
                                              shadows: [
                                                Shadow(
                                                    color: Colors.black54.withOpacity(1),
                                                    offset: Offset(20.0, 15.0),
                                                    blurRadius: 6
                                                )
                                              ]), textAlign: TextAlign.start,
                                          child: AnimatedTextKit(
                                            animatedTexts: [
                                              TypewriterAnimatedText("I'm Tudor", speed: Duration(milliseconds: 250))
                                            ],
                                            totalRepeatCount: 1,
                                          ),
                                        )
                                    ),
                                    Container(
                                        width: windowWidth,
                                        child: DefaultTextStyle(
                                          style: GoogleFonts.raleway(fontSize: 36, color: Colors.white, fontWeight: FontWeight.bold,
                                              shadows: [
                                                Shadow(
                                                    color: Colors.black54.withOpacity(1),
                                                    offset: Offset(20.0, 15.0),
                                                    blurRadius: 6
                                                )
                                              ]), textAlign: TextAlign.start,
                                          child: AnimatedTextKit(
                                            animatedTexts: [
                                              TypewriterAnimatedText("", speed: Duration(milliseconds: 200)),
                                              TypewriterAnimatedText("mobile developer", speed: Duration(milliseconds: 200))
                                            ],
                                            totalRepeatCount: 1,
                                          ),
                                        )
                                    ),
                                    Container(
                                        width: windowWidth,
                                        padding: EdgeInsets.only(top: 50),
                                        child: Text('freelancer native android & flutter', style: GoogleFonts.raleway(fontSize: 20, color: Colors.grey,
                                            shadows: [
                                              Shadow(
                                                  color: Colors.black54.withOpacity(0.5),
                                                  offset: Offset(20.0, 15.0),
                                                  blurRadius: 6
                                              )
                                            ]), textAlign: TextAlign.start)
                                    ),

                                  ],
                                )
                            ),
                          ),
                          // right side with picture
                        ],
                      )
                  ),
                ),
                // ------------------------- Me Image
                Expanded(
                  flex: 20,
                  child: Container(
                    child: AnimatedOpacity(
                      duration: Duration(seconds: 2),
                      curve: Curves.easeInCubic,
                      opacity: isScrollCreated ? 1 : 0,
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('me.jpg')
                            )
                        ),
                      ),
                    ),
                  ),
                ),
                // ------------------------- Contact me button
                Expanded(
                  flex: 10,
                  child: Container(
                    margin: EdgeInsets.only(top: 50, left: windowWidth * 0.03),
                    child: Row(
                      children: [
                        AnimatedContainer(
                          duration: Duration(milliseconds: 700),
                          curve: Curves.elasticOut,
                          width: 100 ,
                          height: 50,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                                  elevation: MaterialStateProperty.all(20)
                              ),
                              onPressed: (){
                                scrollController.animateTo(windowHeight * 4.5, duration: Duration(seconds: 3), curve: Curves.easeInQuint);
                              },
                              child: Text('Contact me!', style: GoogleFonts.raleway(color: Colors.white, fontSize: 14),)
                          ),
                        ),
                        Container()
                      ],
                    ),
                  ),
                ),
                Expanded(flex: 5, child: Container(),)
              ],
            ),
          ),
          // ------------------------- Portofolio
          Container(
            width: windowWidth,
            height: windowHeight * 1.5,
            constraints: BoxConstraints(minHeight: 700),
            color: Colors.white,
            child: Column(
              children: [
                // ------------------------- Title and description
                Expanded(
                  flex: 1,
                  child: Container(
                      padding: EdgeInsets.only(left: windowWidth * 0.05, bottom: 50),
                      width: windowWidth,
                      color: Colors.amber,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              constraints: BoxConstraints(minHeight: 50),
                              width: windowWidth,
                              margin: EdgeInsets.only(top: windowHeight * 0.05),
                              child: DefaultTextStyle(
                                  style: GoogleFonts.raleway(fontSize: 34, color: kJET, fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                            color: Colors.black54.withOpacity(0.3),
                                            offset: Offset(20.0, 15.0),
                                            blurRadius: 6
                                        )
                                      ]),
                                  child: AnimatedTextKit(
                                    animatedTexts: [
                                      TyperAnimatedText("", speed: Duration(milliseconds: 300)),
                                      TyperAnimatedText("My Portofolio", speed: Duration(milliseconds: 100))
                                    ],
                                    isRepeatingAnimation: false,
                                  )
                              )
                          ),
                          Container(
                            constraints: BoxConstraints(minHeight: 50),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(top: 20),
                                  width: windowWidth * 0.6,
                                  child: Text("Here are some projects I have been working on, starting from the wireframe with pencil and paper, building UI, testing for the smoothest experience and creating the final product",
                                    style: GoogleFonts.raleway(fontSize: 18, color: Colors.black),
                                    textAlign: TextAlign.start,
                                  ),
                                ),

                              ],
                            ),
                          )
                        ],
                      )
                  ),
                ),
                // ------------------------- Pictures with the projects
                Expanded(
                  flex: 2,
                  child: Container(
                    color: kPGC,
                    constraints: BoxConstraints(minHeight: 300),
                    child: Column(
                      children: [
                        // ------------------------- First row of pictures
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: (){
                                    showDialog(context: context, builder: (context) => bloodlineDialog);
                                  },
                                  onHover: (hover){
                                    setState(() {
                                      isBloodlineHovering = hover;
                                    });
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.easeInOutCubic,
                                    height: windowHeight,
                                    color: Colors.red[800],
                                    padding: EdgeInsets.symmetric(horizontal: isBloodlineHovering ? 0 : windowWidth * 0.01),
                                    child: Image(image: AssetImage('Bloodline.png'),),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: (){showDialog(context: context, builder: (context) => tftDialog);},
                                  onHover: (hover){
                                    setState(() {
                                      isTFTHovering = hover;
                                    });
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.easeInOutCubic,
                                    height: windowHeight,
                                    padding: EdgeInsets.symmetric(horizontal: isTFTHovering ? 0 : windowWidth * 0.01),
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [kTFTtop, kTFTbottom]
                                        )
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(flex: 1,child: Image(image: AssetImage('pingutft.png'))),
                                        Expanded(flex: 1,child: Image(image: AssetImage('TFTInfo.png')))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // ------------------------- Second row of pictures
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: (){showDialog(context: context, builder: (context) => pgcDialog);},
                                  onHover: (hover){
                                    setState(() {
                                      isPgcHovering = hover;
                                    });
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.easeInOutCubic,
                                    color: kPGC,
                                    padding: EdgeInsets.symmetric(horizontal: isPgcHovering ? 0 : windowWidth * 0.01),
                                    child: Image(image: AssetImage('pgc.png')),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: (){showDialog(context: context, builder: (context) => golfDialog);},
                                  onHover: (hover){
                                    setState(() {
                                      isGolfSkinsHovering = hover;
                                    });
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.easeInOutCubic,
                                    color: Colors.white,
                                    height: windowHeight,
                                    padding: EdgeInsets.symmetric(horizontal: isGolfSkinsHovering ? 0 : windowWidth * 0.01),
                                    child: Image(image: AssetImage('golfskins.png')),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // ------------------------- Third row of pictures
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: (){showDialog(context: context, builder: (context) => inventoryDialog);},
                                  onHover: (hover){
                                    setState(() {
                                      isInventoryHovering = hover;
                                    });
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.easeInOutCubic,
                                    color: Colors.indigo,
                                    height: windowHeight,
                                    padding: EdgeInsets.symmetric(horizontal: isInventoryHovering ? 0 : windowWidth * 0.01),
                                    child: Image(image: AssetImage('Inventory.png')),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: (){showDialog(context: context, builder: (context) => exchangeDialog);},
                                  onHover: (hover){
                                    setState(() {
                                      isExchangeHovering = hover;
                                    });
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.easeInOutCubic,
                                    color: Colors.yellow,
                                    height: windowHeight,
                                    padding: EdgeInsets.symmetric(horizontal: isExchangeHovering ? 0 : windowWidth * 0.01),
                                    child: Image(image: AssetImage('Exchange.png')),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          // ------------------------- Technologies i'm into
          Container(
            height: windowHeight * 1.7,
            width: windowWidth,
            constraints: BoxConstraints(
                minHeight: 1200
            ),
            child: Column(
              children: [
                // ------------------------- Description
                Expanded(
                  flex: 32,
                  child: Container(
                    constraints: BoxConstraints(minHeight: 650),
                    padding: EdgeInsets.only(left: windowWidth * 0.05, right: windowWidth * 0.05, top: windowHeight * 0.05),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: windowWidth,
                          child: Text('What I enjoy', style: GoogleFonts.raleway(fontSize: 34, color: Colors.amber, fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                    color: Colors.black54.withOpacity(1),
                                    offset: Offset(20.0, 15.0),
                                    blurRadius: 6
                                )
                              ]), textAlign: TextAlign.start,),
                        ),
                        Column(
                          children: [
                            Container(
                                width: windowWidth,
                                margin: EdgeInsets.only(top: 20),
                                child: RichText(
                                  text: TextSpan(
                                      text: 'My passion for the mobile development started in the second year of faculty where I was first introduced to this domain. Since then, I worked on multiple projects, learning how to build native ',
                                      style: GoogleFonts.raleway(fontSize: 18, color: Colors.white),
                                      children: <TextSpan>[
                                        TextSpan(text: 'android', style: GoogleFonts.montserratAlternates(fontSize: 14, color: kAndroid)),
                                        TextSpan(text: ' applications that respect all the mordern guidelines.')
                                      ]
                                  ),
                                )
                            ),
                            Text(''),
                            Container(
                                width: windowWidth,
                                child: RichText(
                                  text: TextSpan(
                                      text: 'The main language I used for the projects was ',
                                      style: GoogleFonts.raleway(fontSize: 18, color: Colors.white),
                                      children: [
                                        TextSpan(text: 'Java', style: GoogleFonts.lato(fontSize: 18, color: kJava, fontWeight: FontWeight.w700)),
                                        TextSpan(text: ', perfecting my knowledge, I learned how to implement and use an API, manipulate with data '
                                            'provided by it. I have worked with different kind of databases, both SQL and noSQL, some examples being ',),
                                        TextSpan(text: 'My', style: GoogleFonts.orbitron(fontSize: 14, color: kMySql1)),
                                        TextSpan(text: 'SQL', style: GoogleFonts.orbitron(fontSize: 14, color: kMySql2)),
                                        TextSpan(text: ', ',),
                                        TextSpan(text: 'SQLite', style: GoogleFonts.oldStandardTt(fontSize: 18, color: kMySql2)),
                                        TextSpan(text: ' and '),
                                        TextSpan(text: 'Firebase', style: GoogleFonts.montserrat(fontSize: 18, color: Colors.amber)),
                                        TextSpan(text: ','),
                                        TextSpan(text: ' with the latter also creating authentication systems with email, '),
                                        TextSpan(text: 'G', style: GoogleFonts.montserrat(fontSize: 18, color: kGoogleBlue)),
                                        TextSpan(text: 'o', style: GoogleFonts.montserrat(fontSize: 18, color: kGoogleRed)),
                                        TextSpan(text: 'o', style: GoogleFonts.montserrat(fontSize: 18, color: kGoogleYellow)),
                                        TextSpan(text: 'g', style: GoogleFonts.montserrat(fontSize: 18, color: kGoogleBlue)),
                                        TextSpan(text: 'l', style: GoogleFonts.montserrat(fontSize: 18, color: kGoogleGreen)),
                                        TextSpan(text: 'e', style: GoogleFonts.montserrat(fontSize: 18, color: kGoogleRed)),
                                        TextSpan(text: ' and '),
                                        TextSpan(text: 'Facebook', style: GoogleFonts.ptSans(fontSize: 18, color: kFacebook, fontWeight: FontWeight.w700)),
                                        TextSpan(text: ' tokens.')
                                      ]
                                  ),
                                )

                            ),
                            Text(''),
                            Container(
                                width: windowWidth,
                                child: RichText(
                                  text: TextSpan(
                                      text: 'From October 2020, I started learning ',
                                      style: GoogleFonts.raleway(fontSize: 18, color: Colors.white),
                                      children: [
                                        TextSpan(text: 'Flutter', style: GoogleFonts.montserrat(fontSize: 18, color: kFlutter)),
                                        TextSpan(text: ', a UI sdk created by '),
                                        TextSpan(text: 'G', style: GoogleFonts.montserrat(fontSize: 18, color: kGoogleBlue)),
                                        TextSpan(text: 'o', style: GoogleFonts.montserrat(fontSize: 18, color: kGoogleRed)),
                                        TextSpan(text: 'o', style: GoogleFonts.montserrat(fontSize: 18, color: kGoogleYellow)),
                                        TextSpan(text: 'g', style: GoogleFonts.montserrat(fontSize: 18, color: kGoogleBlue)),
                                        TextSpan(text: 'l', style: GoogleFonts.montserrat(fontSize: 18, color: kGoogleGreen)),
                                        TextSpan(text: 'e', style: GoogleFonts.montserrat(fontSize: 18, color: kGoogleRed)),
                                        TextSpan(text: ' to develop applications for Android, iOS, Desktop and Web '
                                            '(like this website which was created in '),
                                        TextSpan(text: 'Flutter', style: GoogleFonts.montserrat(fontSize: 18, color: kFlutter)),
                                        TextSpan(text: '!).'),
                                        TextSpan(text: ' After learning about the state management, '),
                                        TextSpan(text: 'REST api', style: GoogleFonts.montserrat(fontSize: 18, color: Colors.green)),
                                        TextSpan(text: ', connecting databases, animations and best practices, I have done my bachelor degree project with this framework.')
                                      ]
                                  ),
                                )
                            ),
                            Text(''),
                            Container(
                              width: windowWidth,

                              child: Text('At the beginning of the year 2021 I started being a freelancer, accomplishing multiple projects from people around the world! Of course, '
                                  'using native Java and Flutter.'
                                , style: GoogleFonts.raleway(fontSize: 18, color: Colors.white),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // ------------------------- Pictures
                Expanded(
                  flex: 9,
                  child: Container(
                    padding: EdgeInsets.only(top: 30),
                    constraints: BoxConstraints(minHeight: 300),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // ------------------------- Android
                        Row(
                          children: [
                            Expanded(flex:10, child: Container()),
                            Expanded(
                              flex: 4,
                              child: InkWell(
                                onTap: (){print('hover android'); shakeAndroidController.forward();},
                                onHover: (hover){
                                  if(hover){
                                    // start the animation
                                    shakeAndroidController.forward();
                                    // after the animation is completed, reset it
                                    // so it can be done for multiple times
                                    shakeAndroidController.addStatusListener((status) {
                                      if(status == AnimationStatus.completed)
                                        shakeAndroidController.reset();
                                    });
                                  }
                                },
                                child: Transform.rotate(
                                  angle: shakeAndroidAnimation.value + 0.3,
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    width: windowWidth * 0.1,
                                    height: windowHeight * 0.1,
                                    child: Image(image: AssetImage('android.png'),),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(flex: 7, child: Container(),)
                          ],
                        ),
                        // ------------------------- Firebase
                        Row(
                          children: [
                            Expanded(flex:4, child: Container()),
                            Expanded(
                              flex: 2,
                              child: InkWell(
                                onTap: (){
                                  shakeFirebaseController.forward();
                                  shakeFirebaseController.addStatusListener((status) {
                                    if(status == AnimationStatus.completed)
                                      shakeFirebaseController.reverse();
                                  });
                                },
                                onHover: (hover){
                                  if(hover){
                                    // start the animation
                                    shakeFirebaseController.forward();
                                    // after the animation is completed, reset it
                                    // so it can be done for multiple times
                                    shakeFirebaseController.addStatusListener((status) {
                                      if(status == AnimationStatus.completed)
                                        shakeFirebaseController.reverse();
                                    });
                                  }
                                },
                                child: Transform.rotate(
                                  angle: shakeFirebaseAnimation.value - 0.3,
                                  child: Container(
                                    width: windowWidth * 0.1,
                                    height: windowHeight * 0.1,
                                    child: Image(image: AssetImage('firebase.png'),),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(flex: 6, child: Container(),)
                          ],
                        ),
                        // ------------------------- Java
                        Row(
                          children: [
                            Expanded(flex: 10, child: Container()),
                            Expanded(
                              flex: 6 ,
                              child: InkWell(
                                onTap: (){
                                  shakeJavaController.forward();
                                  shakeJavaController.addStatusListener((status) {
                                    if(status == AnimationStatus.completed)
                                      shakeJavaController.reverse();
                                  });
                                  },
                                onHover: (hover){
                                  if(hover){
                                    // start the animation
                                    shakeJavaController.forward();
                                    // after the animation is completed, reset it
                                    // so it can be done for multiple times
                                    shakeJavaController.addStatusListener((status) {
                                      if(status == AnimationStatus.completed)
                                        shakeJavaController.reverse();
                                    });
                                  }
                                },
                                child: Transform.rotate(
                                  angle: 0.3,
                                  child: Container(
                                    width: windowWidth * 0.1,
                                    height: windowHeight * 0.1,
                                    margin: EdgeInsets.only(top: shakeJavaAnimation.value),
                                    child: Image(image: AssetImage('java.png'),),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(flex: 7, child: Container(),)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // ------------------------- Tap me
                Expanded(
                  flex: 4,
                  child: Container(
                    margin: EdgeInsets.only(top: 50),
                    child: Text("Tap the icons!", style: GoogleFonts.raleway(fontSize: 14, color: Colors.grey)),
                  ),
                )
              ],
            ),
          ),
          // ------------------------- Contact me
          Container(
            height: windowHeight * 1,
            width: windowWidth,
            color: Colors.blueGrey,
            margin: EdgeInsets.only(top: windowHeight * 0.03),
            padding: EdgeInsets.only(left: windowWidth* 0.04, right: windowWidth* 0.04,  top: windowHeight * 0.05),
            constraints: BoxConstraints(
                minHeight: 600
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      // ------------------------- Title
                      Container(
                        width: windowWidth,

                        child: Text('Contact me', style: GoogleFonts.raleway(fontSize: 34, color: Colors.white, fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                  color: Colors.black54.withOpacity(1),
                                  offset: Offset(20.0, 15.0),
                                  blurRadius: 6
                              )
                            ]), textAlign: TextAlign.start,),
                      ),
                      // ------------------------- Description
                      Container(
                          margin: EdgeInsets.only(top: windowHeight * 0.05),
                          child: Text("I'm always ready to work on new projects and expand my knowledge. If you have any question, request or want"
                              " to get in touch, complete the form.",
                              style: GoogleFonts.raleway(fontSize: 18, color: Colors.white)
                          )
                      ),
                    ],
                  ),
                ),
                // ------------------------- Form
                Expanded(
                  flex: 3,
                  child: Container(
                    margin: EdgeInsets.only(top: windowHeight * 0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(),
                        Column(
                          children: [
                            // ------------------------- Email
                            Container(
                              constraints: BoxConstraints(
                                  maxWidth: 300
                              ),
                              decoration: BoxDecoration(
                                  boxShadow: [BoxShadow(color: Colors.black54, offset: Offset(4,3), blurRadius: 6)]
                              ),
                              child: Column(
                                children: [
                                  CustomInput(
                                    width: windowWidth,
                                    height: 50,
                                    controller: email,
                                    hint: "Email",
                                    color: kGrey,
                                  ),
                                ],
                              ),
                            ),
                            // ------------------------- Subject
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              constraints: BoxConstraints(
                                  maxWidth: 300
                              ),
                              decoration: BoxDecoration(
                                  boxShadow: [BoxShadow(color: Colors.black54, offset: Offset(4,3), blurRadius: 6)]
                              ),
                              child: Column(
                                children: [
                                  CustomInput(
                                    width: windowWidth,
                                    height: 50,
                                    controller: subject,
                                    hint: "Subject",
                                    color: kGrey,
                                  ),
                                ],
                              ),
                            ),
                            // ------------------------- Message
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              constraints: BoxConstraints(
                                  maxWidth: 300
                              ),
                              decoration: BoxDecoration(
                                  boxShadow: [BoxShadow(color: Colors.black54, offset: Offset(4,3), blurRadius: 6)]
                              ),
                              child: Column(
                                children: [
                                  CustomInput(
                                    width: windowWidth,
                                    height: 250,
                                    controller: message,
                                    hint: "Subject",
                                    color: kGrey,
                                    maxLines: 20,
                                  ),
                                ],
                              ),
                            ),
                            AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInBack,
                              margin: EdgeInsets.only(top: 20),
                              width: 150,
                              height: 50,
                              child: MaterialButton(
                                onPressed: (){

                                  if(
                                    email.text.isEmpty ||
                                    subject.text.isEmpty ||
                                    message.text.isEmpty
                                  ) {
                                    SnackBar snackBar = SnackBar(content: Text(
                                        'Complete all fields first!'));
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        snackBar);
                                  }
                                  else {
                                    DatabaseService().sendRequest(
                                        email.text.trim(),
                                        subject.text.trim(),
                                        message.text.trim()
                                    );

                                    email.clear();
                                    subject.clear();
                                    message.clear();

                                    SnackBar snackBar = SnackBar(content: Text(
                                        'Thank you for the message!'));
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        snackBar);
                                  }
                                },
                                color: Colors.blue,
                                hoverColor: Colors.green,
                                animationDuration: Duration(milliseconds: 400),
                                hoverElevation: 10,
                                elevation: 5,
                                textColor: Colors.white,
                                child: Text('Send'),
                              ),
                            ),
                          ],
                        ),
                        Container(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

