import 'package:flutter/material.dart';
import 'package:flutter_onboard/flutter_onboard.dart';
import 'package:titans_crypto/constants/colors.dart';
import 'package:titans_crypto/constants/storage.dart';
import 'package:titans_crypto/screens/auth/auth-screen.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = '/SplashScreen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppStorage.coverIntro),
            fit: BoxFit.cover,
          ),
        ),
        child: OnBoard(
          pageController: _pageController,
          // Either Provide onSkip Callback or skipButton Widget to handle skip state
          onSkip: () {
            // print('skipped');
          },
          // Either Provide onDone Callback or nextButton Widget to handle done state
          onDone: () {
            // print('done tapped');
            // Navigator.pushNamed(context, AuthScreen.routeName);
          },
          imageWidth: MediaQuery.of(context).size.height / 3,
          onBoardData: onBoardData,

          titleStyles: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.normal,
            letterSpacing: 0.15,
          ),
          descriptionStyles: const TextStyle(
            fontSize: 16,
            color: AppColors.activeDotColor,
          ),
          pageIndicatorStyle: const PageIndicatorStyle(
            width: 100,
            inactiveColor: AppColors.inActiveDotColor,
            activeColor: AppColors.activeDotColor,
            inactiveSize: Size(12, 12),
            activeSize: Size(12, 12),
          ),
          // Either Provide onSkip Callback or skipButton Widget to handle skip state
          skipButton: TextButton(
            onPressed: () {
              print('skipButton pressed');
              Navigator.pushNamed(context, AuthScreen.routeName);
            },
            child: const Text(
              "Skip",
              style: TextStyle(color: AppColors.primaryColor),
            ),
          ),
          // Either Provide onDone Callback or nextButton Widget to handle done state
          nextButton: OnBoardConsumer(
            builder: (context, ref, child) {
              final state = ref.watch(onBoardStateProvider);
              return InkWell(
                onTap: () => _onNextTap(state),
                child: Container(
                  width: 230,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      // gradient: const LinearGradient(
                      //   colors: [Colors.redAccent, Colors.deepOrangeAccent],
                      // ),
                      color: AppColors.primaryColor),
                  child: Text(
                    state.isLastPage ? "Done" : "Next",
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _onNextTap(OnBoardState onBoardState) {
    if (!onBoardState.isLastPage) {
      _pageController.animateToPage(
        onBoardState.page + 1,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOutSine,
      );
    } else {
      //print("nextButton pressed");
      Navigator.pushNamed(context, AuthScreen.routeName);
    }
  }
}

final List<OnBoardModel> onBoardData = [
  const OnBoardModel(
    title: "Trade anytime anywhere",
    description: "Goal support your motivation and inspire you to work harder",
    imgUrl: AppStorage.firstIntro,
  ),
  const OnBoardModel(
    title: "Save and invest at the same time",
    description:
        "Analyse personal result with detailed chart and numerical values",
    imgUrl: AppStorage.secondIntro,
  ),
  const OnBoardModel(
    title: "Transact fast and easy",
    description:
        "Take before and after photos to visualize progress and get the shape that you dream about",
    imgUrl: AppStorage.thirdIntro,
  ),
];
