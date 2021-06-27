// освежал память тут https://www.youtube.com/watch?v=ON9P6JnY4sU
// квадратное уравнение в общем виде
// a(x*x)+b*x+c = 0

//дискриминант D = b*b-4ac
// D > 0 - у уравнения 2 решения - x1 и x2
// D = 0  - у уравнения 1 решение, x1 = x2
// D < 0 - у уравнения нет решения

//формула нахождения x (2 решения)
// x1 = (-b+√D)/2*a    x2 = (-b-√D)/2*a

import 'dart:math';

void main() {
  String uravneni(double a, double b, double c) {
    String result =
        'Уравнение не имеет решения так как его дискриминант меньше нуля;';

    // считаю дискриминант    
    double disk = b * b - 4 * a * c;
    print("Дискриминант равен $disk");


    double nahodimX1(double disk, double a, double b, double c) {
      double x1 = (-b + sqrt(disk)) / (2 * a);
      return x1;
    }

    double nahodimX2(double disk, double a, double b, double c) {
      double x2 = (-b - sqrt(disk)) / (2 * a);
      return x2;
    }

    // 2 решения
    if (disk > 0) {
      double myX1 = nahodimX1(disk, a, b, c);
      double myX2 = nahodimX2(disk, a, b, c);

      result =
          "Квадратное уравнение имеет два разных корня. X1 = $myX1; и X2 = $myX2;";

      return result;
      // если 1 решение
    } else if (disk == 0) {
      double myX1 = nahodimX1(disk, a, b, c);
      result = "Квадратное уравнение имеет единственное решение; X = $myX1;";
      return result;
    }

    // если D < 0 соответственно решения нет
    return result;
  }

  print(uravneni(1, 5, 6));
}
