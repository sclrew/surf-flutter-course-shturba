void main() {
  List myArray = const [1, 1.5, 1.74, 2, 8, 101, 4];
  
  void calcMiddle(array) {
    double result = 0;

    for (int i = 0; i < array.length; i++) {
      result += array[i];
    }
    result = result / array.length;
    print(result);
  }

  calcMiddle(myArray);
}
