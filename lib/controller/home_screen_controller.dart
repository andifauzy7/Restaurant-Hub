import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restaurant_hub/data/request_data.dart';
import 'package:restaurant_hub/data/response.dart';
import 'package:restaurant_hub/data/response_restaurant_list.dart';
import 'package:restaurant_hub/data/response_search_restaurant.dart';

class HomeScreenController extends GetxController {
  Rx<ResponseCall> response = ResponseCall.loading('Getting list restaurant ...').obs;
  RxList<Restaurant> dataList = <Restaurant>[].obs;

  /// Controller Input
  TextEditingController searchController = TextEditingController();

  Future<void> getRestaurantList() async {
    response(ResponseCall.loading('Getting list restaurant ...'));
    try {
      var result = await RequestData.get('list', Map());
      response(ResponseCall.completed(ResponseRestaurantList.fromJson(result).restaurants));
      dataList.assignAll(List.from(response.value.data));
    } catch (e) {
      response(ResponseCall.error(e.toString()));
    }
  }

  Future<void> searchRestaurantList() async {
    response(ResponseCall.loading('Getting search restaurant ...'));
    try {
      var result = await RequestData.get('search', {
        'q' : searchController.text
      });
      response(ResponseCall.completed(ResponseSearchRestaurant.fromJson(result).restaurants));
      dataList.assignAll(List.from(response.value.data));
    } catch (e) {
      response(ResponseCall.error(e.toString()));
    }
  }

  @override
  void onInit() {
    getRestaurantList();
    super.onInit();
  }
}