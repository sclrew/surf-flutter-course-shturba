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
