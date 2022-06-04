import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_onboard/flutter_onboard.dart';
import 'package:restaurants_app/screen/choice.dart';
class IntroScreen extends StatelessWidget {
final PageController _pageController = PageController();
@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Color(0Xfffff8f2),

    body: OnBoard(
      imageHeight: 250,
      imageWidth: 200,
      pageController: _pageController,

      onSkip: () {
        // print('skipped');
      },

      onDone: () {
        // print('done tapped');
      },
      onBoardData: onBoardData,
      titleStyles: const TextStyle(
        color: Color(0Xff8c3f0b),
        fontSize: 23,
        fontWeight: FontWeight.w900,
        letterSpacing: 0.15,


      ),
      descriptionStyles: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: Colors.grey,
      ),
      pageIndicatorStyle: const PageIndicatorStyle(
        width: 50,
        inactiveColor: Colors.grey,
        activeColor: Colors.deepOrange,
        inactiveSize: Size(8, 8),
        activeSize: Size(8, 8),
      ),

      skipButton: TextButton(
        onPressed: () {
          // print('skipButton pressed');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const options_Page()),
          );
        },
        child: Row(
          mainAxisAlignment:MainAxisAlignment.end ,
          children: [

            const Text(
              "Skip ",
              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),
            ),
            Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 18,)
          ],
        ),
      ),

      nextButton:Container()


      // OnBoardConsumer(
      //   builder: (context, ref, child) {
      //     final state = ref.watch(onBoardStateProvider);
      //     return InkWell(
      //       onTap: () => _onNextTap(state),
      //       child: Container(
      //         width: 230,
      //         height: 50,
      //         alignment: Alignment.center,
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(30),
      //           gradient: const LinearGradient(
      //             colors: [Colors.redAccent, Colors.deepOrangeAccent],
      //           ),
      //         ),
      //         child: Text(
      //           state.isLastPage ? "Done" : "Next",
      //           style: const TextStyle(
      //             color: Colors.white,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //       ),
      //     );
      //   },
      // ),
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
  }
}
}

final List<OnBoardModel> onBoardData = [
  const OnBoardModel(
    title: "Choose your meal!",
    description: "Order anything you want from \nrestaurant",
    imgUrl: "Image/Intro1.png",
  ),
  const OnBoardModel(
    title: "Track your Order!",
    description:
    "As soon as hear the sound on \nyour door, your food has \ncame",
    imgUrl: 'Image/into2.png',
  ),
  const OnBoardModel(
    title: "Enjoy your meal!",
    description:
    "Once the food is delivered \nthen enjoy it with your \nboddies",
    imgUrl: 'Image/into3.gif',
  ),
];