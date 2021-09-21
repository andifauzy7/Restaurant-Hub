// To parse this JSON data, do
//
//     final responseSearchRestaurant = responseSearchRestaurantFromJson(jsonString);

import 'dart:convert';

import 'package:restaurant_hub/data/response_restaurant_list.dart';

ResponseSearchRestaurant responseSearchRestaurantFromJson(String str) => ResponseSearchRestaurant.fromJson(json.decode(str));

String responseSearchRestaurantToJson(ResponseSearchRestaurant data) => json.encode(data.toJson());

class ResponseSearchRestaurant {
  ResponseSearchRestaurant({
    this.error,
    this.founded,
    this.restaurants,
  });

  bool? error;
  int? founded;
  List<Restaurant>? restaurants;

  factory ResponseSearchRestaurant.fromJson(Map<String, dynamic> json) => ResponseSearchRestaurant(
    error: json["error"],
    founded: json["founded"],
    restaurants: List<Restaurant>.from(json["restaurants"].map((x) => Restaurant.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "founded": founded,
    "restaurants": List<dynamic>.from(restaurants!.map((x) => x.toJson())),
  };
}
