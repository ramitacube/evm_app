import 'package:car_rental/pages/on_boarding/on_board_controller.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: OnBoardPage(),
    );
  }
}

class OnBoardPage extends StatefulWidget {
  const OnBoardPage({Key key}) : super(key: key);

  @override
  _OnBoardPageState createState() => _OnBoardPageState();
}

class _OnBoardPageState extends StateMVC<OnBoardPage> {
  OnBoardController _onBoardController;
  CarouselController obCarouselController = CarouselController();
  int _current = 0;

  _OnBoardPageState() : super(OnBoardController()) {
    _onBoardController = controller;
  }

  @override
  void initState() {
    _onBoardController.listenForobImages();
    _onBoardController.listenForHeaderText();
    _onBoardController.listenForSubHeaderText();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Stack(
        children: <Widget>[
          CarouselSlider.builder(
              carouselController: obCarouselController,
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
                enableInfiniteScroll: false,
                initialPage: 0,
                reverse: false,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.easeIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                autoPlay: false,
                height: MediaQuery.of(context).size.height,
                viewportFraction: 1,
                aspectRatio: 2.0,
                disableCenter: true,
              ),
              itemCount: 2,
              itemBuilder: (BuildContext context, int index, realIndex) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: <Widget>[
                      Container(
                          height: MediaQuery.of(context).size.height * .7,
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset(
                            _onBoardController.obImages[index],
                            fit: BoxFit.fill,
                          )),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: _onBoardController.obImages.map((url) {
                              int index =
                                  _onBoardController.obImages.indexOf(url);
                              return Container(
                                width: _current == index ? 5.0 : 4.0,
                                height: _current == index ? 5.0 : 4.0,
                                margin: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 2.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFF2CB9B0),
                                ),
                              );
                            }).toList(),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .02,
                          ),
                          Text(
                            _onBoardController.header[index],
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Let's us know your name , email \n and your password",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .02,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * .06,
                            width: 245,
                            child: RaisedButton(
                              color: _current != 1
                                  ? Color.fromRGBO(12, 13, 52, 0.05)
                                  : Theme.of(context).accentColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              onPressed: () {
                                _current != 1
                                    ? obCarouselController.nextPage()
                                    : print("Finish");
                                // Navigator.of(context).pushAndRemoveUntil(
                                //     MaterialPageRoute(
                                //         builder: (BuildContext context) =>
                                //             OnBoardSuccess()),  (Route<dynamic> route) => false);
                              },
                              child: Text(
                                "Next",
                                style: TextStyle(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}
