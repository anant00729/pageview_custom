import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_page_view_slider/custom_icon.dart';
import 'data.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}



var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;


class _HomeState extends State<Home> {

  double current_page = images.length - 1.0;


  @override
  Widget build(BuildContext context) {

    PageController _pc = PageController(initialPage: images.length -1);
    _pc.addListener((){
      setState(() {
        current_page = _pc.page;
      });
    });

    return Scaffold(
      backgroundColor: Color(0xFF2d3447),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 16.0 , bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(CustomIcon.menu,
                      color: Colors.white,
                      size: 30
                    ),

                    onPressed: (){

                    },


                  ),
                  IconButton(
                    icon: Icon(Icons.search,
                        color: Colors.white,
                        size: 30
                    ),

                    onPressed: (){

                    },


                  )
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                  Text('Trending',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 46.0,
                      fontFamily: "Calibre-Semibold",
                      letterSpacing: 1.0
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      CustomIcon.option,
                      size: 12.0,
                      color: Colors.white,

                    ),
                    onPressed: (){

                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left : 20.0),
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xffff6e6e),
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                    child: Center(
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 6.0),
                          child: Text('Animated' , style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ),
                  SizedBox(width: 15.0,),
                  Text('25+ Stories', style: TextStyle(color: Colors.blueAccent),),


                ],
              ),
            ),

            Stack(
              children: <Widget>[
                CardScrollWidget(current_page: current_page,),
                Positioned.fill(
                  child: PageView.builder(
                    itemCount: images.length,
                    controller: _pc,
                    reverse: true,
                    itemBuilder: (context, index) {
                      return Container();
                    },
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Favourite",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 46.0,
                        fontFamily: "Calibre-Semibold",
                        letterSpacing: 1.0,
                      )),
                  IconButton(
                    icon: Icon(
                      CustomIcon.option,
                      size: 12.0,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 22.0, vertical: 6.0),
                        child: Text("Latest",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Text("9+ Stories",
                      style: TextStyle(color: Colors.blueAccent))
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 18.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset("assets/image_02.jpg",
                        width: 296.0, height: 222.0),
                  ),
                )
              ],
            )

          ],
        ),
      )
    );
  }
}

class CardScrollWidget  extends StatelessWidget {

  var current_page;
  var padding = 20.0;
  var verticalInset = 20.0;

  CardScrollWidget({this.current_page});

  @override
  Widget build(BuildContext context) {
    return new AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(builder: (context, contraints) {
        var width = contraints.maxWidth;
        var height = contraints.maxHeight;

        var safeWidth = width - 2 * padding;
        var safeHeight = height - 2 * padding;

        var heightOfPrimaryCard = safeHeight;
        var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

        var primaryCardLeft = safeWidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 2;

        List<Widget> cardList = new List();

        for (var i = 0; i < images.length; i++) {
          var delta = i - current_page;
          bool isOnRight = delta > 0;

          var start = padding +
              max(
                  primaryCardLeft -
                      horizontalInset * -delta * (isOnRight ? 15 : 1),
                  0.0);

          var cardItem = Positioned.directional(
            top: padding + verticalInset * max(-delta, 0.0),
            bottom: padding + verticalInset * max(-delta, 0.0),
            start: start,
            textDirection: TextDirection.rtl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(3.0, 20.0),
                      blurRadius: 10.0)
                ]),
                child: AspectRatio(
                  aspectRatio: cardAspectRatio,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[

                      Image.asset(images[i], fit: BoxFit.cover),
                      Container(
                        decoration: BoxDecoration(
                        color: Colors.black54,
                      ),),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: Text(titles[i],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.0,
                                      fontFamily: "SF-Pro-Text-Regular")),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 12.0, bottom: 12.0),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 22.0, vertical: 6.0),
                                decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Text("Read Later",
                                    style: TextStyle(color: Colors.white)),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
          cardList.add(cardItem);
        }
        return Stack(
          children: cardList,
        );
      }),
    );
  }
}

