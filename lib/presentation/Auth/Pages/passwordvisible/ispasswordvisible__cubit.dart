import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


class IspasswordvisibleCubit extends Cubit<bool> {
  IspasswordvisibleCubit() : super(true);

  void toogle() => emit(!state);
}


