import 'package:faneron_mobile/src/core/presentation/entities/input.dart';

abstract class AuthEvent {}

class OnLoadAuthEvent extends AuthEvent {}

class OnTapSendDataAuthEvent extends AuthEvent {}

class OnEditInputDataAuthEvent extends AuthEvent {
  final AuthInputsData inputs;

  OnEditInputDataAuthEvent(this.inputs);
}
