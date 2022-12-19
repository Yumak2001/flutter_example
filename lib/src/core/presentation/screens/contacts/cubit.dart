import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ContactsCubit extends Cubit<ContactsState> {
  ContactsCubit() : super(ContactsState()) {
    _onPageCreated();
  }

  Future<void> _onPageCreated() async {}
}

class ContactsState {}

ContactsState copyWith() {
  return ContactsState();
}
