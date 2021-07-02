class MyGeneric<T> {

  T show(something) {
    something = something.toString();
    // print(something);
    return something;
  }

}

void main() {
  MyGeneric text = MyGeneric();

  Map<String, String> aaa = {'name': '123', 'ooops': 'empty'};

  print(text.show('Holla people').runtimeType);
  print(text.show(aaa).runtimeType);
}
