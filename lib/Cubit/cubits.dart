import 'package:bloc/bloc.dart';

class DropdownCubit extends Cubit<String> {
  DropdownCubit() : super('Pakistan');

  void selectedCity(String? country) {
    emit(country!);
  }
}

class TabsIndexCubit extends Cubit<int> {
  TabsIndexCubit() : super(0);

  void updateIndex(int index) {
    emit(index);
  }
}

class FavouriteCubit extends Cubit<bool> {
  FavouriteCubit(super.isBool);

  void updateBool(bool isBool) {
    emit(isBool = !isBool);
  }
}

class CustomCounterState {
  final int counter;
  final bool isAddIconPressed;
  final bool isRemoveIconPressed;

  CustomCounterState({
    required this.counter,
    required this.isAddIconPressed,
    required this.isRemoveIconPressed,
  });
}

class CustomCounterCubit extends Cubit<CustomCounterState> {
  CustomCounterCubit()
      : super(CustomCounterState(
            counter: 1, isAddIconPressed: false, isRemoveIconPressed: false));

  void incrementCounter() {
    emit(CustomCounterState(
        counter: state.counter + 1,
        isAddIconPressed: true,
        isRemoveIconPressed: false));
  }

  void decrementCounter() {
    if (state.counter > 1) {
      emit(CustomCounterState(
        counter: state.counter - 1,
        isAddIconPressed: false,
        isRemoveIconPressed: true,
      ));
    }
  }
}

class SizeButtonCubit extends Cubit<int> {
  int selectedIndex;
  SizeButtonCubit(this.selectedIndex) : super(selectedIndex);

  void updateIndex(int index) {
    emit(selectedIndex = index);
  }
}
class TabsCubit extends Cubit<int> {
  int selectedIndex;
  TabsCubit(this.selectedIndex) : super(selectedIndex);

  void updateIndex(int index) {
    emit(selectedIndex = index);
  }
}
