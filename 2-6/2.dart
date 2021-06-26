void main() {
  // List myArray = [2,2,4,4,4,2];

  void calcMiddle([List array = const [1, 1.5, 1.74, 2, 8, 101, 4]]) {
    double result = 0;

    for (int i = 0; i < array.length; i++) {
      result += array[i];
    }
    result = result / array.length;
    print(result);
  }

  calcMiddle();
  // calcMiddle(myArray);
}
