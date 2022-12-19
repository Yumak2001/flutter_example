import 'dart:typed_data';
import 'package:faneron_mobile/src/core/presentation/entities/enums.dart';

class ImagePickerState {
  final ScreenStatus screenStatus;
  final String? resultPath;
  final bool buttonLoad;
  final bool successUpdate;

  ImagePickerState({
    this.screenStatus = ScreenStatus.view,
    this.resultPath,
    this.buttonLoad = false,
    this.successUpdate = false,
  });

  ImagePickerState copyWith({
    ScreenStatus? screenStatus,
    String? imageResult,
    bool? buttonLoad,
    bool? successUpdate,
  }) =>
      ImagePickerState(
        screenStatus: screenStatus ?? this.screenStatus,
        resultPath: imageResult ?? this.resultPath,
        buttonLoad: buttonLoad ?? this.buttonLoad,
        successUpdate: successUpdate ?? this.successUpdate,
      );
}
