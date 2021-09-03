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
class WishSight extends Sight {
  String visitTime;

  WishSight(
    this.visitTime,
    String name,
    double lat,
    double lon,
    String url,
    String details,
    String type,
  ) : super(name, lat, lon, url, details, type);
}

// Уже посетил
class VisitedSight extends Sight {
  String visitTime;

  VisitedSight(
    this.visitTime,
    String name,
    double lat,
    double lon,
    String url,
    String details,
    String type,
  ) : super(name, lat, lon, url, details, type);
}
