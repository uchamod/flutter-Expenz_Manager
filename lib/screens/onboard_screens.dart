import 'package:expenze_manager/data/onboardscreen_data.dart';
import 'package:expenze_manager/model/onboardsreen_model.dart';
import 'package:expenze_manager/screens/onboardfrontpage/front_page.dart';
import 'package:expenze_manager/screens/onboardother_page/onboardother_page.dart';
import 'package:expenze_manager/screens/userdetails.dart';
import 'package:expenze_manager/util/constants.dart';
import 'package:expenze_manager/widgets/shared_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

//implemant onboarding screens
class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  //page controller managr the pageviwe process
  final PageController _controller = PageController();
  bool showUserDetailPage = false; //track the last board
  @override
  Widget build(BuildContext context) {
    //data for the onboard screen
    List<OnboardScreenmodel> onBoardScreenData =
        OnBoardScreenData().onboardData;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //difine the range
            Expanded(
              //set up onboarding screens
              child: Stack(
                children: [
                  //onboard pages
                  PageView(
                    controller: _controller, //controll the list of screens
                    //detect the page change
                    onPageChanged: (value) {
                      setState(() {
                        showUserDetailPage = value == 3;
                      });
                    },
                    //page list
                    children: [
                      const FrontPage(),
                      OnboardotherPage(
                          imagePath: onBoardScreenData[0].imagePath,
                          title: onBoardScreenData[0].title,
                          discription: onBoardScreenData[0].diacription),
                      OnboardotherPage(
                          imagePath: onBoardScreenData[1].imagePath,
                          title: onBoardScreenData[1].title,
                          discription: onBoardScreenData[1].diacription),
                      OnboardotherPage(
                          imagePath: onBoardScreenData[2].imagePath,
                          title: onBoardScreenData[2].title,
                          discription: onBoardScreenData[2].diacription),
                    ],
                  ),
                  //page indicator
                  Container(
                    alignment: const Alignment(0, 0.45),
                    child: SmoothPageIndicator(
                      controller: _controller,
                      count: 4,
                      //add effect
                      effect: ExpandingDotsEffect(
                          activeDotColor: kcButtonBlue,
                          dotColor: kcDiscription,
                          expansionFactor: 3,
                          dotHeight: 10,
                          dotWidth: 20),
                    ),
                  ),
                  //positinaed button
                  Positioned(
                      bottom: 40,
                      left: 0,
                      right: 0,
                      child: !showUserDetailPage
                          ? GestureDetector(
                              onTap: () {
                                _controller.animateToPage(
                                    //navigate pages using page controller
                                    _controller.page!.toInt() +
                                        1, //get the next page index
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.decelerate);
                              },
                              child: showUserDetailPage
                                  ? CoustomButton(
                                      text: "Get Started",
                                      buttonColor: kcButtonBlue)
                                  : CoustomButton(
                                      text: "Next", buttonColor: kcButtonBlue),
                            )
                          //in the last board
                          : GestureDetector(
                              onTap: () {
                                //navigator
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const UserDetails(),
                                    ));
                              },
                              child: showUserDetailPage
                                  ? CoustomButton(
                                      text: "Get Started",
                                      buttonColor: kcButtonBlue)
                                  : CoustomButton(
                                      text: "Next", buttonColor: kcButtonBlue),
                            )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
