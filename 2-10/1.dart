class User {
  String name;
  String family;

  User({this.name = "Juliko", this.family = "Banditto"});

  @override
  String toString() {
    return 'Это же я - Студент: ${name} ${family}';
  }
}

class Student extends User {
  DateTime yearOfAdmission = DateTime.utc(2015, 1, 1);

  @override
  String toString() {
    print('\n----');
    print(super.toString());
    return 'Год поступления ${yearOfAdmission.year.toString()} \n Текущий курс ${_currentCourse().toString()}\n';
  }

  int _currentCourse() {
    return DateTime.now().year.toInt() - yearOfAdmission.year.toInt();
  }
}

void main() {
  Student student = Student();
  // student.yearOfAdmission = DateTime(2018);

  print(student.toString());
}
