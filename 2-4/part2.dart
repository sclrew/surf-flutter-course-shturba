import 'dart:collection';

main() {
//6

  int a = 8;

  a % 2 == 0 ? print('чётное') : print('не чётное');

//7

  print('I \u2665 dart');

// 8
  List<int> list = [1, 2, 3, 4, 5, 6, 7, 8];

//b
  print(list.length);

//c
  list.sort();
  print(list.reversed);

//d
  print(list.sublist(1, 4));

//e
  print(list.indexOf(5));

//f
  list.removeWhere((element) => (element >= 5 && element <= 8));
  print(list);

//g
  list[0] = 10;
  list[1] = 20;
  list[2] = 30;
  print(list);

//9
//a
  Map numberBook = {
    'Иван': '2264865',
    'Татьяна': '89523366684',
    'Олег': '84952256575',
  };
//b
  print(numberBook);

//c
  numberBook['Екатерина'] = '2359942';

//d
//
  Map sortedNumberBook = new SplayTreeMap.from(
      numberBook, (key1, key2) => numberBook[key2].compareTo(numberBook[key1]));
  print(sortedNumberBook);

//10

  Set mySet = {'Москва', 'Вашингтон', 'Париж'};
  mySet.add('Вашингтон');
  print(mySet.length);
  // Класс Set представляет неупорядоченный набор уникальных объектов.
  // потому одинаковых значений там быть не может

// 11
  String myText =
      "She sells sea shells on the sea shore The shells that she sells are sea shells I am sure. So if she sells sea shells on the sea shore I am sure that the shells are sea shore shells";
  myText = myText.replaceAll('.', '');
  myText = myText.toUpperCase();
  List<String> myTextList = myText.split(' ');
  var myTextSet = myTextList.toSet();
  print(myTextSet.length);  
  // 14 Уникальных слов
}
