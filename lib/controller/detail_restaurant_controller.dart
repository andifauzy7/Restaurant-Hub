import 'package:get/get.dart';
import 'package:restaurant_hub/data/request_data.dart';
import 'package:restaurant_hub/data/response.dart';
import 'package:restaurant_hub/data/response_detail_restaurant.dart';

class DetailRestaurantController extends GetxController {
  Rx<ResponseCall> response = ResponseCall.loading('Getting detail restaurant ...').obs;
  Restaurant restaurant = Restaurant();

  Future<void> getRestaurantList(String id) async {
    response(ResponseCall.loading('Getting detail restaurant ...'));
    try {
      var result = await RequestData.get('detail/$id');
      response(ResponseCall.completed(ResponseDetailRestaurant.fromJson(result).restaurant));
      restaurant = response.value.data;
    } catch (e) {
      response(ResponseCall.error(e.toString()));
    }
  }
}