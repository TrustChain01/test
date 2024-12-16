import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:trustchain/constants/colors.dart';
import 'package:trustchain/screens/userSelection.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff00cc99),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [const Color.fromARGB(255, 230, 213, 67), Colors.blue],
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: PageView(
                  controller: pageController,
                  children: [
                    _page(
                        "Say Goodbye to Paper Trails! \nEasily access, share, and verify your academic certificates securely using blockchain technology.",
                        screenHeight,
                        screenWidth),
                    _page(
                        "Opportunities at Your Fingertips! \nApply for jobs and get instant credential verification for a seamless hiring process.",
                        screenHeight,
                        screenWidth),
                    _page(
                        "Find the Right Talent in No Time! \nPost job openings, verify applicants' credentials, and make informed hiring decisions.",
                        screenHeight,
                        screenWidth),
                  ],
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                     
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SmoothPageIndicator(
                      controller: pageController,
                      count: 3,
                      effect: const WormEffect(
                        dotHeight: 12,
                        dotWidth: 12,
                        spacing: 8,
                        activeDotColor: Colors.black,
                        dotColor: Colors.grey,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: currentIndex == 2
                          ? Hero(
                              tag: "tag1",
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => UserSelection(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "Get Started",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                              ),
                            )
                          : TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => UserSelection(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Skip",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _page(String description, double height, double width) {
    return FadeInUp(
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Lottie.asset(
              'assets/images/certificate.json',
              height: height * 0.4,
              width: width * 0.8,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                description,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
