void main() {
  String chisla = '';
  print('\nfor: \n');
  for (int i = 0; i < 101; i++) {
    if (i % 2 != 0) {
      chisla += i.toString() + ' ';
    }
  }
  print(chisla + '\n');

  chisla = '';
  int i = 0;
  print('\nwhile: \n');

  while (i < 101) {
    if (i % 2 != 0) {
      chisla += i.toString() + ' ';
    }
    i++;
  }

  print(chisla + '\n');
  
}
