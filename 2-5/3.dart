import 'dart:io';

void main() {
  String input = '';
  double summa = 0;
  double chislo = 0;

  do {
    print('-----------------');
    print('Введите число:\n');
    input = stdin.readLineSync().toString();

    chislo = double.tryParse(input) ?? 0;

    double proverka = summa;

    summa += chislo;

    if (proverka == summa && summa != 0) {
      summa = 0;
      print('Вы не ввели число, обнуляем сумму');
      print( 'Сумма: $summa');
      continue;
    }

    if (summa != 0) {
      print('Сумма: $summa');
    }
  } while (input != 'stop');
}
