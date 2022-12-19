import 'package:faneron_mobile/src/core/data/storage/user.dart';
import 'package:faneron_mobile/src/core/presentation/router/bloc/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SplashOnBoardingCubit extends Cubit<OnBoardingState> {
  final UserDataStorage userDataStorage;
  final RouterEventSink _routerEventSink;

  SplashOnBoardingCubit(
    this._routerEventSink,
    this.userDataStorage,
  ) : super(OnBoardingState()) {
    _animateSplashScreen();
  }

  Future<void> _animateSplashScreen() async {
    await Future.delayed(Duration(milliseconds: 200));
    emit(state.copyWith(
      upperLightOpacity: 1,
      elioOpacity: 1,
      splashOpacity: 0,
      splashGradientOpacity: 1,
    ));
  }

  onSplashScreenAnimationEnd() async {
    await Future.delayed(Duration(milliseconds: 1000));
    if (!userDataStorage.isOnBoardingNeeded) {
      _toHomeFromSplash();
    } else {
      _toFirstStep();
    }
  }

  onTapNextStep(double screenWidth) {
    switch (state.currentStep) {
      case 1:
        _toSecondStep(screenWidth);
        break;
      case 2:
        _toThirdStep();
        break;
      case 3:
        _toForthStep();
        break;
    }
  }

  onTapPreviousStep(double screenWidth) {
    switch (state.currentStep) {
      case 2:
        _toFirstStep();
        break;
      case 3:
        _toSecondStep(screenWidth);
        break;
      case 4:
        _toThirdStep();
        break;
      case 5:
        _toForthStep();
        break;
    }
  }

  onButtonGoPressed() => _openDoor();

  Future<void> _toHomeFromSplash() async {
    emit(state.copyWith(
      animationDuration: Duration(milliseconds: 300),
      elioOpacity: 0,
      upperLightOpacity: 0,
      splashGradientOpacity: 0,
    ));
    await Future.delayed(
      Duration(milliseconds: 200),
    );
    _routerEventSink.onRouteToHome();
  }

  Future<void> _toFirstStep() async {
    emit(state.copyWith(
      currentStep: 1,
      animationDuration: Duration(milliseconds: 300),
      cardOneRight: -4,
      arOpacity: 1,
      arHeight: 150,
      arTop: 75,
      elioOpacity: 0,
      upperLightOpacity: 0,
      splashGradientOpacity: 0,
      elioSize: 0,

      ///undo second step
      laboratoryOpacity: 0,
      laboratoryRight: 0,
      laboratoryTop: 120,
      pictureOneTop: 258,
      pictureOneWidth: 280,
      pictureOneOpacity: 0,
      pictureTwoTop: 550,
      pictureTwoWidth: 280,
      pictureTwoOpacity: 0,
      cardTwoLeft: -430,
    ));
  }

  Future<void> _toSecondStep(double screenWidth) async {
    emit(state.copyWith(
      currentStep: 2,

      ///clean first step
      cardOneRight: -390,
      arOpacity: 0,
      arTop: 230,
      arHeight: 0,

      /// add second step
      laboratoryOpacity: 1,
      laboratoryRight: (screenWidth - 315) / 2,
      laboratoryTop: 60,
      pictureOneTop: 155,
      pictureOneWidth: 315,
      pictureOneOpacity: 1,
      pictureTwoOpacity: 1,
      pictureTwoTop: 510,
      pictureTwoWidth: 315,
      cardTwoLeft: -4,

      ///undo thirds step
      ticketOneTop: 70,
      ticketOneLeft: -80,
      ticketOneOpacity: 0,
      ticketTwoTop: -20,
      ticketTwoRight: -50,
      ticketTwoOpacity: 0,
      ticketThreeTop: 360,
      ticketThreeRight: -50,
      ticketThreeOpacity: 0,
      cardThreeRight: -383,
    ));
  }

  Future<void> _toThirdStep() async {
    emit(state.copyWith(
      currentStep: 3,

      ///clean second step
      laboratoryOpacity: 0,
      pictureOneOpacity: 0,
      pictureTwoOpacity: 0,
      cardTwoLeft: -430,

      /// add new step
      ticketOneLeft: -28,
      ticketOneTop: 97,
      ticketOneOpacity: 1,
      ticketTwoTop: 5,
      ticketTwoRight: 0,
      ticketTwoOpacity: 1,
      ticketThreeTop: 320,
      ticketThreeRight: 0,
      ticketThreeOpacity: 1,
      cardThreeRight: -4,

      ///undo fourth
      doorLeftOpacity: 0,
      doorRightOpacity: 0,
    ));
  }

  Future<void> _toForthStep() async {
    emit(state.copyWith(
        currentStep: 4,

        ///clean third step
        ticketOneTop: 70,
        ticketOneLeft: -335,
        ticketOneOpacity: 0,
        ticketTwoTop: -20,
        ticketTwoRight: -378,
        ticketTwoOpacity: 0,
        ticketThreeTop: 360,
        ticketThreeRight: -318,
        ticketThreeOpacity: 0,
        cardThreeRight: -383,
        doorLeftOpacity: 1,
        doorRightOpacity: 1

        ///add fourth
        ));
  }

  Future<void> _openDoor() async {
    userDataStorage.isOnBoardingNeeded = false;
    emit(state.copyWith(
        animationDuration: Duration(milliseconds: 300),
        currentStep: 5,
        isDoorsOpening: true,
        doorLeftOpacity: 0,
        doorRightOpacity: 0));
    await Future.delayed(Duration(milliseconds: 200));
    _routerEventSink.onRouteToHome();
  }
}

class OnBoardingState {
  ///splash animation
  final Duration animationDuration;
  final int currentStep;
  final double upperLightOpacity;
  final double splashOpacity;
  final double splashGradientOpacity;
  final double elioOpacity;
  final double? elioSize;

  ///first step
  final double cardOneRight;
  final double arHeight;
  final double arTop;
  final double arOpacity;

  ///second step
  final double laboratoryOpacity;
  final double laboratoryRight;
  final double laboratoryTop;
  final double pictureOneTop;
  final double pictureOneWidth;
  final double pictureOneOpacity;
  final double pictureTwoTop;
  final double pictureTwoWidth;
  final double pictureTwoOpacity;
  final double cardTwoLeft;

  ///third step
  final double ticketOneTop;
  final double ticketOneLeft;
  final double ticketOneOpacity;
  final double ticketTwoTop;
  final double ticketTwoRight;
  final double ticketTwoOpacity;
  final double ticketThreeTop;
  final double ticketThreeRight;
  final double ticketThreeOpacity;
  final double cardThreeRight;

  ///doors
  final bool isDoorsOpening;
  final double doorsOpacity;

  ///initial values
  OnBoardingState({
    this.currentStep = 0,
    this.cardOneRight = -390,
    this.arOpacity = 0,
    this.arHeight = 0,
    this.arTop = 230,
    this.upperLightOpacity = 0,
    this.splashOpacity = 1,
    this.splashGradientOpacity = 0,
    this.elioOpacity = 0,
    this.elioSize,
    this.animationDuration = const Duration(milliseconds: 500),
    this.laboratoryOpacity = 0,
    this.laboratoryRight = 0,
    this.laboratoryTop = 120,
    this.pictureOneTop = 258,
    this.pictureOneWidth = 280,
    this.pictureOneOpacity = 0,
    this.cardTwoLeft = -430,
    this.pictureTwoTop = 550,
    this.pictureTwoWidth = 280,
    this.pictureTwoOpacity = 0,
    this.ticketOneTop = 70,
    this.ticketOneLeft = -80,
    this.ticketOneOpacity = 0,
    this.ticketTwoTop = -20,
    this.ticketTwoRight = -50,
    this.ticketTwoOpacity = 0,
    this.ticketThreeTop = 360,
    this.ticketThreeRight = -50,
    this.ticketThreeOpacity = 0,
    this.cardThreeRight = -383,
    this.doorsOpacity = 0,
    this.isDoorsOpening = false,
  });

  OnBoardingState copyWith({
    Duration? animationDuration,
    int? currentStep,
    double? upperLightOpacity,
    double? splashOpacity,
    double? splashGradientOpacity,
    double? elioOpacity,
    double? elioSize,
    double? cardOneRight,
    double? arHeight,
    double? arTop,
    double? arOpacity,
    double? laboratoryOpacity,
    double? laboratoryRight,
    double? laboratoryTop,
    double? pictureOneTop,
    double? pictureOneWidth,
    double? pictureOneOpacity,
    double? pictureTwoTop,
    double? pictureTwoWidth,
    double? pictureTwoOpacity,
    double? cardTwoLeft,
    double? ticketOneTop,
    double? ticketOneLeft,
    double? ticketOneOpacity,
    double? ticketTwoTop,
    double? ticketTwoRight,
    double? ticketTwoOpacity,
    double? ticketThreeTop,
    double? ticketThreeRight,
    double? ticketThreeOpacity,
    double? cardThreeRight,
    bool? isDoorsOpening,
    double? doorLeftOpacity,
    double? doorRightOpacity,
  }) {
    return OnBoardingState(
      animationDuration: animationDuration ?? this.animationDuration,
      currentStep: currentStep ?? this.currentStep,
      upperLightOpacity: upperLightOpacity ?? this.upperLightOpacity,
      splashOpacity: splashOpacity ?? this.splashOpacity,
      splashGradientOpacity: splashGradientOpacity ?? this.splashGradientOpacity,
      elioOpacity: elioOpacity ?? this.elioOpacity,
      elioSize: elioSize ?? this.elioSize,
      cardOneRight: cardOneRight ?? this.cardOneRight,
      arHeight: arHeight ?? this.arHeight,
      arTop: arTop ?? this.arTop,
      arOpacity: arOpacity ?? this.arOpacity,
      laboratoryOpacity: laboratoryOpacity ?? this.laboratoryOpacity,
      laboratoryRight: laboratoryRight ?? this.laboratoryRight,
      laboratoryTop: laboratoryTop ?? this.laboratoryTop,
      pictureOneTop: pictureOneTop ?? this.pictureOneTop,
      pictureOneWidth: pictureOneWidth ?? this.pictureOneWidth,
      pictureOneOpacity: pictureOneOpacity ?? this.pictureOneOpacity,
      pictureTwoTop: pictureTwoTop ?? this.pictureTwoTop,
      pictureTwoWidth: pictureTwoWidth ?? this.pictureTwoWidth,
      pictureTwoOpacity: pictureTwoOpacity ?? this.pictureTwoOpacity,
      cardTwoLeft: cardTwoLeft ?? this.cardTwoLeft,
      ticketOneTop: ticketOneTop ?? this.ticketOneTop,
      ticketOneLeft: ticketOneLeft ?? this.ticketOneLeft,
      ticketOneOpacity: ticketOneOpacity ?? this.ticketOneOpacity,
      ticketTwoTop: ticketTwoTop ?? this.ticketTwoTop,
      ticketTwoRight: ticketTwoRight ?? this.ticketTwoRight,
      ticketTwoOpacity: ticketTwoOpacity ?? this.ticketTwoOpacity,
      ticketThreeTop: ticketThreeTop ?? this.ticketThreeTop,
      ticketThreeRight: ticketThreeRight ?? this.ticketThreeRight,
      ticketThreeOpacity: ticketThreeOpacity ?? this.ticketThreeOpacity,
      cardThreeRight: cardThreeRight ?? this.cardThreeRight,
      isDoorsOpening: isDoorsOpening ?? this.isDoorsOpening,
      doorsOpacity: doorRightOpacity ?? this.doorsOpacity,
    );
  }
}
