import 'dart:typed_data';
import 'package:faneron_mobile/src/core/domain/repository/profile.dart';
import 'package:faneron_mobile/src/core/presentation/screens/image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class ImagePickerCubit extends Cubit<ImagePickerState> {
  final ProfileRepository profileRepository;

  ByteData? afterImage;

  ImagePickerCubit(
    this.profileRepository,
  ) : super(ImagePickerState()) {}

  onTapImage(String data) async {
    emit(state.copyWith(
      imageResult: data,
    ));
  }

  updateAfterImage(ByteData image) async {
    afterImage = image;
  }

  sendImage(String filePath) async {
    emit(state.copyWith(
      buttonLoad: true,
    ));
    var result = await profileRepository.sendImage(filePath);
    profileRepository.myProfileUpdate();
    emit(state.copyWith(buttonLoad: false, successUpdate: result));
  }
}
