// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'controllers/state_controller.dart';

final stateProvider = StateNotifierProvider<IncrementNotifier, int>((ref) {
  return IncrementNotifier();
});
