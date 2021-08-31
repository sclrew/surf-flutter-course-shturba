// import 'package:flutter/material.dart';

// class MyRange {
//   double start = 10;
//   double end = 10000;

//   MyRange({required this.start, required this.end});
// }

// class MyRangeCalc {
//   static ValueNotifier<MyRange> myRange =
//       ValueNotifier(MyRange(start: 10, end: 10000));

//   ValueNotifier<MyRange> newRange(MyRange newRange) {
//     myRange.value.start = newRange.start;
//     myRange.value.end = newRange.end;
//     // ignore: avoid_print
//     print('новое значение записано');

//     // ignore: avoid_print
//     print(myRange.value.toString());
//     return myRange;
//   }

//   void refresh() {
//     myRange.value = MyRange(start: 10, end: 10000);

//     // ignore: avoid_print
//     print('refresh');
//   }
// }
