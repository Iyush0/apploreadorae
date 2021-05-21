import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'authentication/login/login_Screen.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => Login()),
    );
  }

  Widget _buildFullscrenImage() {
    return Image.network(
      'https://s3-alpha-sig.figma.com/img/5ba7/8d4f/1bd476c12ba707731d74628022bafb86?Expires=1619395200&Signature=Oa9soX5po23IgWUts7UgXyimdqKrWh6kIve2R-TUCHgS4aanVu9QzGKvcjLzs3VuQ6A6Hlk-i0ihj-lkIPk9Q6q5witp9~pOZ4X69YLIWoTn8EYavpNWJYfNs0ljy5csTOtKVbizLogxX7G7aZbHo6-JdvD-3vKPlJhrgC8BR8o0W1~pbIDILP-qLWqr4nbxBh5TKpy3fep7UX8lxvNWyVmYu0QbsyolOsRwidHy74nPeFY~NiVRTPTWvpW1bvVZiwLYLl10oHHNokJBWVZ7FYNDro353hvr1zQl92ChTcruosSzfJFvt5hkfE7lfDYdTNRnLQt3U~CvqPfebhyhbw__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.network('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            child: SvgPicture.asset('assets/1.svg'),
          ),
        ),
      ),
      // globalFooter: SizedBox(
      //   width: double.infinity,
      //   height: 60,
      //   child: ElevatedButton(
      //     child: const Text(
      //       'Let\s go right away!',
      //       style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      //     ),
      //     onPressed: () => _onIntroEnd(context),
      //   ),
      // ),
      pages: [
        PageViewModel(
          title: "",
          bodyWidget: Column(
            children: <Widget>[
              SizedBox(height: height * 0.63),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: RichText(
                    text: TextSpan(
                      text: ' Welcome ',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                      ),
                      children: [
                        TextSpan(
                          text: ' to ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                          ),
                        ),
                        TextSpan(
                          text: ' Adorae ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.014),
              Center(
                child: Text(
                  "India's Fashion Social Network",
                  style: TextStyle(
                    letterSpacing: 2,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: height * 0.037),
              Center(
                child: Text(
                  """Lorem ipsum is simply dummy text of the
    printing and typesetting industry.""",
                  style: TextStyle(
                    letterSpacing: 1,
                    color: Color(0xff7f7f7f),
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          // "Instead of having to buy an entire share, invest any amount you want.",
          // image: _buildImage('https://s3-alpha-sig.figma.com/img/5ba7/8d4f/1bd476c12ba707731d74628022bafb86?Expires=1619395200&Signature=Oa9soX5po23IgWUts7UgXyimdqKrWh6kIve2R-TUCHgS4aanVu9QzGKvcjLzs3VuQ6A6Hlk-i0ihj-lkIPk9Q6q5witp9~pOZ4X69YLIWoTn8EYavpNWJYfNs0ljy5csTOtKVbizLogxX7G7aZbHo6-JdvD-3vKPlJhrgC8BR8o0W1~pbIDILP-qLWqr4nbxBh5TKpy3fep7UX8lxvNWyVmYu0QbsyolOsRwidHy74nPeFY~NiVRTPTWvpW1bvVZiwLYLl10oHHNokJBWVZ7FYNDro353hvr1zQl92ChTcruosSzfJFvt5hkfE7lfDYdTNRnLQt3U~CvqPfebhyhbw__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA'),
          // decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Learn as you go",
          body:
              "Download the Stockpile app and master the market with our mini-lesson.",
          // image: _buildImage('img2.jpg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Full Screen Page",
          body:
              "Pages can be full screen as well.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc id euismod lectus, non tempor felis. Nam rutrum rhoncus est ac venenatis.",
          // image: _buildFullscrenImage(),
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(horizontal: 16),
            fullScreen: true,
            bodyFlex: 2,
            imageFlex: 3,
          ),
        ),
        PageViewModel(
          title: "Title of last page - reversed",
          bodyWidget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Click on ", style: bodyStyle),
              Icon(Icons.edit),
              Text(" to edit a post", style: bodyStyle),
            ],
          ),
          decoration: pageDecoration.copyWith(
            bodyFlex: 1,
            imageFlex: 4,
            bodyAlignment: Alignment.topCenter,
            imageAlignment: Alignment.topCenter,
          ),
          // image: _buildImage('img1.jpg'),
          reverse: true,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: false,
      skipFlex: 0,
      nextFlex: 0,
      //rtl: true, // Display as right-to-left
      skip: const Text('Skip'),
      next: Text(""),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.only(left: 16, right: 16, bottom: 200),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(8.0, 8.0),
        color: Color(0xFFe2e2e2),
        activeSize: Size(13.0, 13.0),
        activeColor: Color(0xFF000000),
        spacing: EdgeInsets.all(2),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      isBottomSafeArea: false,
      dotsFlex: 1,
      // dotsContainerDecorator: const ShapeDecoration(
      // color: Colors.black87,
      // shape: RoundedRectangleBorder(
      // borderRadius: BorderRadius.all(Radius.circular(8.0)),
      // ),
      // ),
    );
  }
}
