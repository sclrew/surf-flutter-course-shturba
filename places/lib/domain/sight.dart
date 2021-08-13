// enum MyTypes { nature, history, interes }

class Sight {
  String name;
  double lat;
  double lon;
  String url;
  String details;
  String type;

  Sight(this.name, this.lat, this.lon, this.url, this.details, this.type);
}

// Хочу посетить
class WantToSeeSight extends Sight {
  String visitTime;

  WantToSeeSight(this.visitTime, String name, double lat, double lon,
      String url, String details, String type)
      : super(name, lat, lon, url, details, type);
}

// Уже посетил
class CheckedSight extends Sight {
  String visitTime;

  CheckedSight(this.visitTime, String name, double lat, double lon, String url,
      String details, String type)
      : super(name, lat, lon, url, details, type);
}
