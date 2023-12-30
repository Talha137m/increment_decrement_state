import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/data_class.dart';

class IncrementNotifier extends StateNotifier<int> {
  IncrementNotifier() : super(0);
  void increment({required int index, required List<DataClass> list}) {
    print('increment$index');
    list[index].value += 1;
    state = list[index].value;
    print('valueooooooooo${list[index].value}');
    print('staeeeeeeeeee$state');
  }

  void decrement({required int index, required List<DataClass> list}) {
    list[index].value -= 1;
    state = list[index].value;
  }
}
