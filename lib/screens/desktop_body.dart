import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portofolio/colors.dart';

class DesktopBody extends StatefulWidget {
  @override
  _DesktopBodyState createState() => _DesktopBodyState();
}

class _DesktopBodyState extends State<DesktopBody> {

  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;

    return Container(
      color: kJET,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          // Name and contact button
          Container(
            width: windowWidth,
            height: windowHeight,
            child: Column(
              children: [
                Expanded(flex: 30, child: Container(),),
                Container(
                  constraints: BoxConstraints(minHeight: 300),
                  child: Row(
                    children: [
                      Expanded(flex: 2, child: Container()),
                      Expanded(
                        flex: 48,
                        child: Container(
                            width: windowWidth,
                            child: Column(
                              children: [
                                Container(
                                    width: windowWidth,
                                    child: Text("I'm Tudor", style: GoogleFonts.raleway(fontSize: 80, color: Colors.white, fontWeight: FontWeight.bold,
                                          shadows: [
                                                Shadow(
                                                    color: Colors.black54.withOpacity(1),
                                                    offset: Offset(20.0, 15.0),
                                                    blurRadius: 6
                                                )
                                              ]), textAlign: TextAlign.start,)
                                ),
                                Container(
                                    width: windowWidth,
                                    child: Text('mobile developer', style: GoogleFonts.raleway(fontSize: 80, color: Colors.white, fontWeight: FontWeight.bold,
                                        shadows: [
                                          Shadow(
                                              color: Colors.black54.withOpacity(1),
                                              offset: Offset(20.0, 15.0),
                                              blurRadius: 6
                                          )
                                        ]), textAlign: TextAlign.start)
                                ),
                                Container(
                                    width: windowWidth,
                                    padding: EdgeInsets.only(top: 50),
                                    child: Text('freelancer native android & flutter', style: GoogleFonts.raleway(fontSize: 36, color: Colors.grey,
                                        shadows: [
                                          Shadow(
                                              color: Colors.black54.withOpacity(0.5),
                                              offset: Offset(20.0, 15.0),
                                              blurRadius: 6
                                          )
                                        ]), textAlign: TextAlign.start)
                                ),
                                // ------------------------- Contact me button
                                Container(
                                  width: windowWidth,
                                  height: 50,
                                  margin: EdgeInsets.only(top: 50),
                                  child: Row(
                                    children: [
                                      AnimatedContainer(
                                        duration: Duration(milliseconds: 700),
                                        curve: Curves.elasticOut,
                                        width: 150 ,
                                        height: 50,
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
                                              elevation: MaterialStateProperty.all(20)
                                            ),
                                            onPressed: (){},
                                            child: Text('Contact me!', style: GoogleFonts.raleway(color: Colors.white),)
                                        ),
                                      ),
                                      Container()
                                    ],
                                  ),
                                )
                              ],
                            )
                        ),
                      ),
                      Expanded(flex: 50, child: Container(width: windowWidth, height: windowHeight,))
                    ],
                  )
                  ),
                Expanded(flex: 33, child: Container(),),
              ],
            ),
          ),
          // ------------------------- Portofolio
          Container(
            width: windowWidth,
            height: windowHeight * 0.5,
            constraints: BoxConstraints(minHeight: 700),
            color: Colors.white,
            child: Column(
              children: [
                // ------------------------- Title and description
                Expanded(
                  flex: 1,
                  child: Container(
                      padding: EdgeInsets.only(left: windowWidth * 0.02, bottom: 50),
                      width: windowWidth,
                      color: Colors.amber,
                      child: Column(
                        children: [
                          Container(
                              constraints: BoxConstraints(minHeight: 100),
                              width: windowWidth,
                              child: Text('My Portofolio', 
                                style: GoogleFonts.raleway(fontSize: 64, color: kJET, fontWeight: FontWeight.bold, 
                                    shadows: [
                                      Shadow(
                                        color: Colors.black54.withOpacity(0.3),
                                        offset: Offset(20.0, 15.0),
                                        blurRadius: 6
                                      )
                                    ]), 
                                textAlign: TextAlign.start, 
                              )
                          ),
                          Container(
                            constraints: BoxConstraints(minHeight: 100),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(top: 50),
                                  width: windowWidth * 0.45,
                                  child: Text("Here are some projects I have been working on, starting from the wireframe with pencil and paper, building UI, testing for the smoothest experience and creating the final product",
                                        style: GoogleFonts.raleway(fontSize: 24, color: Colors.black),
                                        textAlign: TextAlign.start,
                                  ),
                                ),
                                Container(
                                  width: windowWidth * 0.5,
                                )
                              ],
                            ),
                          )
                        ],
                      )
                  ),
                ),
                // ------------------------- Pictures with the projects
                Expanded(
                  flex: 1,
                  child: Container(
                    color: kPGC,
                    constraints: BoxConstraints(minHeight: 300),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: AnimatedContainer(
                              duration: Duration(milliseconds: 700),
                              height: windowHeight,
                              color: Colors.red[800],
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Image(image: AssetImage('Bloodline.png'),),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 700),
                            height: windowHeight,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [kTFTtop, kTFTbottom]
                              )
                            ),
                            child: Image(image: AssetImage('pingutft.png')),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 700),
                            color: kPGC,
                            child: Image(image: AssetImage('pgc.png')),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 700),
                            color: Colors.white,
                            height: windowHeight,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Image(image: AssetImage('golfskins.png')),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 700),
                            color: Colors.indigo,
                            height: windowHeight,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Image(image: AssetImage('Inventory.png')),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 700),
                            color: Colors.yellow,
                            height: windowHeight,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Image(image: AssetImage('Exchange.png')),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          // ------------------------- Technologies i'm into
          Container(
            height: windowHeight * 0.8,
            width: windowWidth,
            constraints: BoxConstraints(
              minHeight: 800
            ),
            child: Row(
              children: [
                // ------------------------- Description
                Expanded(
                  flex: 1,
                  child: Container(
                    height: windowHeight,
                    padding: EdgeInsets.only(left: windowWidth * 0.02),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: windowWidth,
                          child: Text('What I enjoy', style: GoogleFonts.raleway(fontSize: 64, color: Colors.amber, fontWeight: FontWeight.bold,
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
                              child: RichText(
                                text: TextSpan(
                                  text: 'My passion for the mobile development started in the second year of faculty where I was first introduced to this domain. Since then, I worked on multiple projects, learning how to build native ',
                                  style: GoogleFonts.raleway(fontSize: 20, color: Colors.white),
                                  children: <TextSpan>[
                                    TextSpan(text: 'android', style: GoogleFonts.montserratAlternates(fontSize: 20, color: kAndroid)),
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
                                  style: GoogleFonts.raleway(fontSize: 20, color: Colors.white),
                                  children: [
                                    TextSpan(text: 'Java', style: GoogleFonts.lato(fontSize: 20, color: kJava, fontWeight: FontWeight.w700)),
                                    TextSpan(text: ', perfecting my knowledge, I learned how to implement and use an API, manipulate with data '
                                        'provided by it. I have worked with different kind of databases, both SQL and noSQL, some examples being ',),
                                    TextSpan(text: 'My', style: GoogleFonts.orbitron(fontSize: 18, color: kMySql1)),
                                    TextSpan(text: 'SQL', style: GoogleFonts.orbitron(fontSize: 18, color: kMySql2)),
                                    TextSpan(text: ', ',),
                                    TextSpan(text: 'SQLite', style: GoogleFonts.oldStandardTt(fontSize: 20, color: kMySql2)),
                                    TextSpan(text: ' and '),
                                    TextSpan(text: 'Firebase', style: GoogleFonts.montserrat(fontSize: 20, color: Colors.amber)),
                                    TextSpan(text: ','),
                                    TextSpan(text: ' with the latter also creating authentication systems with email, '),
                                    TextSpan(text: 'G', style: GoogleFonts.montserrat(fontSize: 20, color: kGoogleBlue)),
                                    TextSpan(text: 'o', style: GoogleFonts.montserrat(fontSize: 20, color: kGoogleRed)),
                                    TextSpan(text: 'o', style: GoogleFonts.montserrat(fontSize: 20, color: kGoogleYellow)),
                                    TextSpan(text: 'g', style: GoogleFonts.montserrat(fontSize: 20, color: kGoogleBlue)),
                                    TextSpan(text: 'l', style: GoogleFonts.montserrat(fontSize: 20, color: kGoogleGreen)),
                                    TextSpan(text: 'e', style: GoogleFonts.montserrat(fontSize: 20, color: kGoogleRed)),
                                    TextSpan(text: ' and '),
                                    TextSpan(text: 'Facebook', style: GoogleFonts.ptSans(fontSize: 20, color: kFacebook, fontWeight: FontWeight.w700)),
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
                                  style: GoogleFonts.raleway(fontSize: 20, color: Colors.white),
                                  children: [
                                    TextSpan(text: 'Flutter', style: GoogleFonts.montserrat(fontSize: 20, color: kFlutter)),
                                    TextSpan(text: ', a UI sdk created by '),
                                    TextSpan(text: 'G', style: GoogleFonts.montserrat(fontSize: 20, color: kGoogleBlue)),
                                    TextSpan(text: 'o', style: GoogleFonts.montserrat(fontSize: 20, color: kGoogleRed)),
                                    TextSpan(text: 'o', style: GoogleFonts.montserrat(fontSize: 20, color: kGoogleYellow)),
                                    TextSpan(text: 'g', style: GoogleFonts.montserrat(fontSize: 20, color: kGoogleBlue)),
                                    TextSpan(text: 'l', style: GoogleFonts.montserrat(fontSize: 20, color: kGoogleGreen)),
                                    TextSpan(text: 'e', style: GoogleFonts.montserrat(fontSize: 20, color: kGoogleRed)),
                                    TextSpan(text: ' to develop applications for Android, iOS, Desktop and Web '
                                        '(like this website which was created in '),
                                    TextSpan(text: 'Flutter', style: GoogleFonts.montserrat(fontSize: 20, color: kFlutter)),
                                    TextSpan(text: '!).'),
                                    TextSpan(text: ' After learning about the state management, '),
                                    TextSpan(text: 'REST api', style: GoogleFonts.montserrat(fontSize: 20, color: Colors.green)),
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
                                , style: GoogleFonts.raleway(fontSize: 20, color: Colors.white),
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
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ------------------------- Android
                      Row(
                        children: [
                          Expanded(flex:5, child: Container()),
                          Expanded(
                            flex: 18,
                            child: Transform.rotate(
                              angle: 0.3,
                              child: Container(
                                width: windowWidth * 0.1,
                                height: windowHeight * 0.1,
                                child: Image(image: AssetImage('android.png'),),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // ------------------------- Firebase
                      Row(
                        children: [
                          Expanded(flex:0, child: Container()),
                          Expanded(
                            flex: 6,
                            child: Transform.rotate(
                              angle: -0.3,
                              child: Container(
                                width: windowWidth * 0.1,
                                height: windowHeight * 0.1,
                                child: Image(image: AssetImage('firebase.png'),),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // ------------------------- Java
                      Row(
                        children: [
                          Expanded(flex:5, child: Container()),
                          Expanded(
                            flex: 18,
                            child: Transform.rotate(
                              angle: 0.3,
                              child: Container(
                                width: windowWidth * 0.1,
                                height: windowHeight * 0.1,
                                child: Image(image: AssetImage('java.png'),),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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