import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';



class RadioButtonCubit extends Cubit<String> {
  RadioButtonCubit() : super("Elder");

  void selectOption(String value){
    emit(value);
  }
}
