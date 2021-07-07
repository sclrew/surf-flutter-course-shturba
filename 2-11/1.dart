import 'dart:io';

String onClick() {
  String input;
  String text = '';
 
  print('put \n!\n for exit');

  do {
    input = "";
    input = stdin.readLineSync().toString();
    text += input;
  } while (input != '!');
  return 'Введена строка $text';
}

Future<String> showText() async {
  try {
    String result = await onClick();
    return result;
  } catch (e) {
    throw e;
  }
}

void main(){
  showText().then((result) {
    print(result);
  });
}

// void main() async {
//  print(await showText());
// }