import 'package:flutter/material.dart';
import 'package:flutter_onboard/flutter_onboard.dart';
import 'package:women_safety_final_project/screens/home_page.dart';
import 'package:women_safety_final_project/screens/login_screen.dart';
import 'package:women_safety_final_project/screens/signup_screen.dart';
import 'package:women_safety_final_project/screens/onBoard_screen.dart';

class OnboardScreen extends StatelessWidget {
  final PageController _pageController = PageController();

  OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void onNextTap(OnBoardState onBoardState) {
      if (!onBoardState.isLastPage) {
        _pageController.animateToPage(
          onBoardState.page + 1,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOutSine,
        );
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return login_screen();
        }));
      }
    }

    return Scaffold(
      body: OnBoard(
        pageController: _pageController,
        onBoardData: onBoardData,
        titleStyles: const TextStyle(
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.w900,
          letterSpacing: 0.15,
        ),
        descriptionStyles: const TextStyle(
          fontSize: 16,
          color: Colors.grey,
        ),
        pageIndicatorStyle: const PageIndicatorStyle(
          width: 70,
          inactiveColor: Colors.grey,
          activeColor: Colors.purpleAccent,
          inactiveSize: Size(8, 8),
          activeSize: Size(12, 12),
        ),
        skipButton: TextButton(
          onPressed: () {
            _pageController.animateToPage(
              3,
              duration: const Duration(microseconds: 250),
              curve: Curves.easeInOutSine,
            );
          },
          child: const Text(
            "Skip",
            style: TextStyle(color: Colors.black),
          ),
        ),
        nextButton: OnBoardConsumer(
          builder: (context, ref, child) {
            final state = ref.watch(onBoardStateProvider);
            return InkWell(
              onTap: () => onNextTap(state),
              child: Container(
                width: 230,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.purple),
                child: Text(
                  state.isLastPage ? "Get Started" : "Next",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

final List<OnBoardModel> onBoardData = [
  const OnBoardModel(
    title: "women violence prevention",
    description: "An application to get help whenever and wherever",
    imgUrl: "assets/Group 6922.png",
  ),
  const OnBoardModel(
    title: "Ask for help anytime",
    description: "Create an account and ensure your safety",
    imgUrl: 'assets/undraw_shared_goals_re_jvqd 1.png',
  ),
];
