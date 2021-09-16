// enum MyTypes { nature, history, interes }

class Sight {
  String name;
  double lat;
  double lon;
  String url;
  String details;
  String type;
  List<String> urls;

  Sight(
    this.name,
    this.lat,
    this.lon,
    this.url,
    this.details,
    this.type,
    this.urls,
  );
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
    List<String> urls,
  ) : super(
          name,
          lat,
          lon,
          url,
          details,
          type,
          urls,
        );
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
    List<String> urls,
  ) : super(
          name,
          lat,
          lon,
          url,
          details,
          type,
          urls,
        );
}
