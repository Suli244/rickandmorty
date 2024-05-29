class EpisodeModel {
  final Info info;
  final List<ResultEpisodModel> results;

  EpisodeModel({
    required this.info,
    required this.results,
  });

  factory EpisodeModel.fromJson(Map<String, dynamic> json) => EpisodeModel(
        info: Info.fromJson(json["info"]),
        results:
            List<ResultEpisodModel>.from(json["results"].map((x) => ResultEpisodModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };

       EpisodeModel copyWith({
    Info? info,
    List<ResultEpisodModel>? results,
  }) {
    return EpisodeModel(
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

class ResultEpisodModel {
  final int id;
  final String name;
  final String airDate;
  final String episode;
  final List<String> characters;
  final String url;
  final DateTime created;

  ResultEpisodModel({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episode,
    required this.characters,
    required this.url,
    required this.created,
  });

  factory ResultEpisodModel.fromJson(Map<String, dynamic> json) => ResultEpisodModel(
        id: json["id"],
        name: json["name"],
        airDate: json["air_date"],
        episode: json["episode"],
        characters: List<String>.from(json["characters"].map((x) => x)),
        url: json["url"],
        created: DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "air_date": airDate,
        "episode": episode,
        "characters": List<dynamic>.from(characters.map((x) => x)),
        "url": url,
        "created": created.toIso8601String(),
      };
}
