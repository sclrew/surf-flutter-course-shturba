import 'dart:io';

Stream<String> onClick() async* {
  while (true) {
    print('\nВведите строку \n');

    String result = stdin.readLineSync().toString();
    yield result;
    if (result == 'exit') break;
  }
}

void main() {
  onClick().listen((word) {
    print('Введена строка $word');
  });
}

// example
//https://www.youtube.com/watch?v=nQBpOIHE4eE
// streamcontroller 
//final myStream = onClick().stream;


// final subscription = onClick().listen(
//     (data) {
//       print(data);
//     },
//     onError: (err) {
//       print(err);
//     },
//     cancelOnError: false,
//     onDone: () {
//       print('Done');
//     });

// subscription.cancel();
// subscription.resume();
// subscription.pause();

