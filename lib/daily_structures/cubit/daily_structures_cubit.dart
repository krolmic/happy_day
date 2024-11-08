import 'package:bloc/bloc.dart';

class DailyStructuresCubit extends Cubit<int> {
  DailyStructuresCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}
