import 'package:get/get.dart';
import 'package:restaurant_hub/data/request_data.dart';
import 'package:restaurant_hub/data/response.dart';
import 'package:restaurant_hub/data/response_restaurant_list.dart';

class HomeScreenController extends GetxController {
  Rx<ResponseCall> response = ResponseCall.loading('Getting list restaurant ...').obs;
  RxList<Restaurant> dataList = <Restaurant>[].obs;

  Future<void> getRestaurantList() async {
    response(ResponseCall.loading('Getting list restaurant ...'));
    try {
      var result = await RequestData.get('list');
      response(ResponseCall.completed(ResponseRestaurantList.fromJson(result).restaurants));
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