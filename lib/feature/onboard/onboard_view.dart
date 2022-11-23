import 'package:flutter/material.dart';

import '../../constants/color_constants.dart';
import '../second_page/second_page.dart';

class OnboardView extends StatelessWidget {
  const OnboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Align(
            alignment: Alignment.center,
            child: Text('video'),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(50, 50),
                  padding: const EdgeInsets.only(
                    right: 50,
                    left: 50,
                  ),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                  backgroundColor: ButtonColors.kPrimaryColor,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: ((context) {
                    return const SecondPage();
                  })));
                },
                child: Text(
                  OnboardTexts.data,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: ButtonColors.whiteColor,
                      ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
