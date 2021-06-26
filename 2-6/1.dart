void main() {
  String a = 'hello world';

  void reverse(String text) {

    List<String> myTextList = text.split(' ');
  
    print(myTextList.reversed.join(' '));
  }

  reverse(a);
}
