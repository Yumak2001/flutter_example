import 'package:faneron_mobile/src/core/presentation/screens/splash_on_boarding/widget/gradient.dart';
import 'package:faneron_mobile/src/core/presentation/screens/splash_on_boarding/widget/second_card.dart';
import 'package:faneron_mobile/src/core/presentation/screens/splash_on_boarding/widget/shadow_container.dart';
import 'package:faneron_mobile/src/core/presentation/screens/splash_on_boarding/widget/three_dots.dart';
import 'package:faneron_mobile/src/resource/picture.dart';
import 'package:faneron_mobile/src/resource/styles.dart';
import 'package:faneron_mobile/src/resource/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'cubit.dart';
import 'widget/first_card.dart';
import 'widget/go_button.dart';
import 'widget/third_card.dart';

///Animated splash screen after native
class SplashOnBoardingPage extends StatefulWidget {
  static const id = "/splash";

  const SplashOnBoardingPage({Key? key}) : super(key: key);

  @override
  State<SplashOnBoardingPage> createState() => _SplashOnBoardingPageState();
}

class _SplashOnBoardingPageState extends State<SplashOnBoardingPage> {
  @override
  void initState() {
    super.initState();

    /// for smooth transition between native splash screen  and this splash screen
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await Future.delayed(Duration(milliseconds: 200));
      FlutterNativeSplash.remove();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backgroundMainPage,
      body: BlocBuilder<SplashOnBoardingCubit, OnBoardingState>(
        builder: (BuildContext context, state) {
          final screenHeight = MediaQuery.of(context).size.height;
          final screenWidth = MediaQuery.of(context).size.width;
          return Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              ///Animated Splash
              AnimatedPositioned(
                top: -(screenHeight / 40),
                height: screenHeight / 1.5,
                duration: state.animationDuration,
                child: AnimatedOpacity(
                  opacity: state.upperLightOpacity,
                  duration: state.animationDuration,
                  child: Image.asset(
                    AppPicture.upperBlurLight,
                  ),
                ),
              ),
              Positioned(
                height: 72,
                child: AnimatedOpacity(
                  onEnd: () => context.read<SplashOnBoardingCubit>().onSplashScreenAnimationEnd(),
                  opacity: state.splashOpacity,
                  duration: state.animationDuration,
                  child: Image.asset(
                    AppPicture.splashLogo,
                  ),
                ),
              ),
              Positioned(
                height: 72,
                child: AnimatedOpacity(
                  opacity: state.splashGradientOpacity,
                  duration: state.animationDuration,
                  child: Image.asset(
                    AppPicture.splashLogoGradient,
                  ),
                ),
              ),
              AnimatedPositioned(
                bottom: 0,
                duration: state.animationDuration,
                height: state.elioSize ?? MediaQuery.of(context).size.height / 2.3,
                child: AnimatedOpacity(
                  opacity: state.elioOpacity,
                  duration: state.animationDuration,
                  child: Image.asset(AppPicture.elio),
                ),
              ),

              ///first step
              AnimatedPositioned(
                top: state.arTop,
                height: state.arHeight,
                duration: state.animationDuration,
                child: AnimatedOpacity(
                  duration: state.animationDuration,
                  opacity: state.arOpacity,
                  child: Image.asset(AppPicture.ar),
                ),
              ),

              AnimatedPositioned(
                top: 258,
                right: state.cardOneRight,
                duration: state.animationDuration,
                child: FirstCard(),
              ),

              ///second step
              AnimatedPositioned(
                top: state.laboratoryTop,
                right: state.laboratoryRight,
                duration: state.animationDuration,
                child: AnimatedOpacity(
                  duration: state.animationDuration,
                  opacity: state.laboratoryOpacity,
                  child: OnBoardingShadowContainer(
                    child: ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (bounds) => linearGradient().createShader(
                        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                      ),
                      child: Text(
                        "Лаборатория".toUpperCase(),
                        style: TextStylesApp.drukCyr500(86, lineHeight: 0.9),
                      ),
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                top: state.pictureOneTop,
                width: state.pictureOneWidth,
                duration: state.animationDuration,
                child: AnimatedOpacity(
                  opacity: state.pictureOneOpacity,
                  duration: state.animationDuration,
                  child: OnBoardingShadowContainer(
                    child: Image.asset(AppPicture.laboratoryContent1),
                  ),
                ),
              ),

              AnimatedPositioned(
                top: state.pictureTwoTop,
                width: state.pictureTwoWidth,
                duration: state.animationDuration,
                child: AnimatedOpacity(
                  opacity: state.pictureTwoOpacity,
                  duration: state.animationDuration,
                  child: OnBoardingShadowContainer(
                    child: Image.asset(AppPicture.laboratoryContent2),
                  ),
                ),
              ),
              AnimatedPositioned(
                left: state.cardTwoLeft,
                width: 380,
                top: 258,
                child: SecondCard(),
                duration: state.animationDuration,
              ),

              ///doors
              AnimatedPositioned(
                  top: 47,
                  right: state.isDoorsOpening ? screenWidth : screenWidth / 2 - 12,
                  width: 172,
                  duration: state.animationDuration,
                  child: AnimatedOpacity(
                    duration: state.animationDuration,
                    child: Image.asset(AppPicture.doorLeft),
                    opacity: state.doorsOpacity,
                  )),
              AnimatedPositioned(
                top: 47,
                left: state.isDoorsOpening ? screenWidth : MediaQuery.of(context).size.width / 2,
                width: 170,
                duration: state.animationDuration,
                child: AnimatedOpacity(
                  duration: state.animationDuration,
                  opacity: state.doorsOpacity,
                  child: Image.asset(AppPicture.doorRight),
                ),
              ),

              ///third step
              AnimatedPositioned(
                height: 334,
                top: state.ticketOneTop,
                left: state.ticketOneLeft,
                duration: state.animationDuration,
                child: AnimatedOpacity(
                  opacity: state.ticketOneOpacity,
                  duration: state.animationDuration,
                  child: Image.asset(AppPicture.ticket1),
                ),
              ),
              AnimatedPositioned(
                height: 378,
                top: state.ticketTwoTop,
                right: state.ticketTwoRight,
                duration: state.animationDuration,
                child: AnimatedOpacity(
                  opacity: state.ticketTwoOpacity,
                  duration: state.animationDuration,
                  child: Image.asset(AppPicture.ticket2),
                ),
              ),
              AnimatedPositioned(
                height: 317.5,
                top: state.ticketThreeTop,
                right: state.ticketThreeRight,
                duration: state.animationDuration,
                child: AnimatedOpacity(
                  opacity: state.ticketThreeOpacity,
                  duration: state.animationDuration,
                  child: Image.asset(AppPicture.ticket3),
                ),
              ),
              AnimatedPositioned(
                top: 258,
                right: state.cardThreeRight,
                child: ThirdCard(),
                duration: state.animationDuration,
              ),
              Positioned(height: 10, bottom: 26, child: ThreeDots(currentStep: state.currentStep)),

              ///tap zones
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () => context.read<SplashOnBoardingCubit>().onTapNextStep(screenWidth),
                  child: Container(
                    height: screenHeight,
                    width: screenWidth / 2,
                    color: Colors.transparent,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: GestureDetector(
                  onTap: () => context.read<SplashOnBoardingCubit>().onTapPreviousStep(screenWidth),
                  child: Container(
                    height: screenHeight,
                    width: screenWidth / 2,
                    color: Colors.transparent,
                    // color: Colors.green.withOpacity(0.1),
                  ),
                ),
              ),
              Positioned(
                top: 282,
                height: 104,
                width: 246,
                child: AnimatedOpacity(
                  opacity: state.doorsOpacity,
                  duration: state.animationDuration,
                  child: GoButton(
                    onTap: () => context.read<SplashOnBoardingCubit>().onButtonGoPressed(),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
