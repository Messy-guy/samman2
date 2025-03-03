import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

// State class with @immutable to ensure immutability.
@immutable
class CheckboxState {
  final bool isChecked;

  // Added const constructor
  const CheckboxState({required this.isChecked});
}

// Cubit class to manage state changes.
class CheckboxCubit extends Cubit<CheckboxState> {
  CheckboxCubit() : super(const CheckboxState(isChecked: false));

  // Method to toggle the checkbox state.
  void toggleCheckbox() {
    emit(CheckboxState(isChecked: !state.isChecked));
  }
}
