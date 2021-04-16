import 'dart:convert';

Model modelFromJson(String str) => Model.fromJson(json.decode(str));

String modelToJson(Model data) => json.encode(data.toJson());

class Model {
  Model({
    this.base,
    this.results,
  });

  String base;
  Map<String, double> results;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        base: json["base"] == null ? null : json["base"],
        results: json["results"] == null
            ? null
            : Map.from(json["results"])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "base": base == null ? null : base,
        "results": results == null
            ? null
            : Map.from(results).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}
