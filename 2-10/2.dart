abstract class Car with Painter, Engine {
  late double weight;

  void run();
}

class Truck extends Car {
  @override
  double get weight => 10;

  @override
  String get colorName => this.setColor(Colors.BLUE);

  @override
  void run() {
    this.runEngine(this.EnginePower, this.weight.toInt());
  }

  @override
  String toString() {
    return 'Грузовик закрашен в $colorName';
  }
}

class Sportcar extends Car {
  @override
  double get weight => 2;

  @override
  String get colorName => this.setColor(Colors.RED);

  @override
  void run() {
    this.runEngine(this.EnginePower, this.weight.toInt());
  }

  @override
  String toString() {
    return 'СпортКар закрашен в $colorName';
  }
}

class Bike with Painter {
  @override
  String get colorName => this.setColor(Colors.GREEN);

  @override
  String toString() {
    return 'Велосипед закрашен в $colorName';
  }
}

enum Colors { RED, GREEN, BLUE }

class Painter {
  String colorName = 'не окрашено';

  String setColor(Colors color) {
    switch (color) {
      case Colors.RED:
        return 'красный';

      case Colors.BLUE:
        return 'синенький';

      case Colors.GREEN:
        return 'зелёный';
    }
  }
}

class Engine {
  int EnginePower = 15;

  void runEngine(int power, int weight) {
    print(
        'Двигатель работает. Максимальная скорость = ${(power / weight).toDouble()}');
  }
}

void main() {
  Bike yamaha = Bike();
  Truck kamaz = Truck();
  Sportcar lada = Sportcar();

  kamaz.run();
  lada.run();

  print(yamaha.toString());
  print(kamaz.toString());
  print(lada.toString());
}
