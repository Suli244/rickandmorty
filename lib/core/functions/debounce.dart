import 'dart:async';

class Debounce {
  Debounce({
    this.oneSec = const Duration(seconds: 1),
  });
  Timer? timer;
  final Duration oneSec;

  call(void Function() event) {
    int start = 1;
    timer?.cancel();
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start == 0) {
          event();
          timer.cancel();
        } else {
          start--;
        }
      },
    );
  }
}
