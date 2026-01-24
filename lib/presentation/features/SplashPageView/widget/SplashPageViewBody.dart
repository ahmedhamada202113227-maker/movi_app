import 'package:flutter/material.dart';
import 'package:movi_app/core/utils/app/styles/app_styles.dart';
import 'package:movi_app/widgets/custom_scaffoldBK.dart';

class SplashPageViewBody extends StatelessWidget {
  const SplashPageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: customScaffoldBK(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            const SizedBox(height: 50),
            Expanded(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'TP ::',
                      style: AppStyles.styleExtraBold30.copyWith(fontSize: 35),
                    ),
                    TextSpan(
                      text: ' MOVIES',
                      style: AppStyles.styleExtraBold30
                          .copyWith(color: Colors.amber.shade600, fontSize: 70),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: SizedBox(
                  width: 80,
                  height: 80,
                  child: CircularProgressIndicator(
                    // strokeWidth: BorderSide.strokeAlignCenter,
                    backgroundColor: Colors.amber,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Expanded(
              flex: 4,
              child: Center(
                child: Image(
                  image: AssetImage(
                    'assets/images/cinema-still-life-background.png',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
