main() {
// 1
  int a;

//2
  double b;

//3
  var text;
  // text = a;
  // не могу присвоить, нужно проинициализировать а

//4

  dynamic dyn = 1;
  // print(dyn.runtimeType); // int
  // print(text.runtimeType); // Null
  text = dyn;
  // print(dyn.runtimeType); //int
  // print(text.runtimeType); //int

  // dynamic тип в зависимости от присвоинного значения  меняется
  //
  // var тип устанавливается в зависимости от присвоинного значения
  // тип не может быть изменен далее
  // НО
  // var если при инициалиции не присвоить значение становится dynamic

//5

  final int fin;
  const int con = 2; // значение фикцируется при создании, не изменяется

  fin = 2; // значение фиксируется при первом вызове, не изменяется
  // fin = 3;
  // con = 3;

}
