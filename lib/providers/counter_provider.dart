import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_provider.g.dart';

@Riverpod(keepAlive: true)
class Counter extends _$Counter {
  @override
  int build(int initialValue) {
    return initialValue;
  }

  void increments() {
    state++;
  }
}
