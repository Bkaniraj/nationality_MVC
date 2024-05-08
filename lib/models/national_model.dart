import 'dart:convert';

class NationalResponse {
  final int? count;
  final String? name;
  final List<Country>? country;

  NationalResponse({
    this.count,
    this.name,
    this.country,
  });

  factory NationalResponse.fromRawJson(String str) =>
      NationalResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NationalResponse.fromJson(Map<String, dynamic> json) =>
      NationalResponse(
        count: json["count"],
        name: json["name"],
        country: json["country"] == null
            ? []
            : List<Country>.from(
                json["country"]!.map((x) => Country.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "name": name,
        "country": country == null
            ? []
            : List<dynamic>.from(country!.map((x) => x.toJson())),
      };
}

class Country {
  final String? countryId;
  final double? probability;

  Country({
    this.countryId,
    this.probability,
  });

  factory Country.fromRawJson(String str) => Country.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        countryId: json["country_id"],
        probability: json["probability"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "country_id": countryId,
        "probability": probability,
      };
}
