import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class QuestionAnswerCubit extends Cubit<QuestionAnswerState> {
  QuestionAnswerCubit() : super(QuestionAnswerState()) {
    _onPageCreated();
  }

  Future<void> _onPageCreated() async {}

  onQuestionTap(int index) async {
    final currentValue = state.expansions[index];
    emit(state.copyWith(expansions: List<bool>.filled(6, false)..[index] = !currentValue));
  }
}

class QuestionAnswerState {
  final List<bool> expansions;

  const QuestionAnswerState({
    this.expansions = const [false, false, false, false, false, false],
  });

  QuestionAnswerState copyWith({
    List<bool>? expansions,
  }) {
    return QuestionAnswerState(
      expansions: expansions ?? this.expansions,
    );
  }
}
