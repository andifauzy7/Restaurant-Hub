
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:restaurant_hub/data/response_restaurant.dart';

class RequestData {
  static final directoryJson = 'assets/local_restaurant.json';

  static Future<ResponseRestaurant> getData() async {
    final String response = await rootBundle.loadString(directoryJson);
    final data = await json.decode(response);
    return ResponseRestaurant.fromJson(data);
  }
}