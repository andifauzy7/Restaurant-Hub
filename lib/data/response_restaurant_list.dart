// To parse this JSON data, do
//
//     final responseRestaurantList = responseRestaurantListFromJson(jsonString);

import 'dart:convert';

ResponseRestaurantList responseRestaurantListFromJson(String str) => ResponseRestaurantList.fromJson(json.decode(str));

String responseRestaurantListToJson(ResponseRestaurantList data) => json.encode(data.toJson());

class ResponseRestaurantList {
  ResponseRestaurantList({
    this.error,
    this.message,
    this.count,
    this.restaurants,
  });

  bool? error;
  String? message;
  int? count;
  List<Restaurant>? restaurants;

  factory ResponseRestaurantList.fromJson(Map<String, dynamic> json) => ResponseRestaurantList(
    error: json["error"],
    message: json["message"],
    count: json["count"],
    restaurants: List<Restaurant>.from(json["restaurants"].map((x) => Restaurant.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "count": count,
    "restaurants": List<dynamic>.from(restaurants!.map((x) => x.toJson())),
  };
}

class Restaurant {
  Restaurant({
    this.id,
    this.name,
    this.description,
    this.pictureId,
    this.city,
    this.rating,
  });

  String? id;
  String? name;
  String? description;
  String? pictureId;
  String? city;
  double? rating;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    pictureId: json["pictureId"],
    city: json["city"],
    rating: json["rating"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "pictureId": pictureId,
    "city": city,
    "rating": rating,
  };
}
