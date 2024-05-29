class LocationModel {
  final Info info;
  final List<ResultLoactionModel> results;

  LocationModel({
    required this.info,
    required this.results,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        info: Info.fromJson(json["info"]),
        results: List<ResultLoactionModel>.from(
            json["results"].map((x) => ResultLoactionModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };

  LocationModel copyWith({
    Info? info,
    List<ResultLoactionModel>? results,
  }) {
    return LocationModel(
      info: info ?? this.info,
      results: results ?? this.results,
    );
  }
}

class Info {
  final int count;
  final int pages;
  final String next;
  final dynamic prev;

  Info({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        count: json["count"],
        pages: json["pages"],
        next: json["next"],
        prev: json["prev"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "pages": pages,
        "next": next,
        "prev": prev,
      };
}

class ResultLoactionModel {
  final int id;
  final String name;
  final String type;
  final String dimension;
  final List<String> residents;
  final String url;
  final DateTime created;

  ResultLoactionModel({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
    required this.residents,
    required this.url,
    required this.created,
  });

  factory ResultLoactionModel.fromJson(Map<String, dynamic> json) =>
      ResultLoactionModel(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        dimension: json["dimension"],
        residents: List<String>.from(json["residents"].map((x) => x)),
        url: json["url"],
        created: DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "dimension": dimension,
        "residents": List<dynamic>.from(residents.map((x) => x)),
        "url": url,
        "created": created.toIso8601String(),
      };
}
