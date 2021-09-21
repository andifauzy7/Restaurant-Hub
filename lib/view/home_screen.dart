import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_hub/components/resto_info_card.dart';
import 'package:restaurant_hub/controller/detail_restaurant_controller.dart';
import 'package:restaurant_hub/controller/home_screen_controller.dart';
import 'package:restaurant_hub/data/response.dart';
import 'package:restaurant_hub/view/detail_restaurant_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreenController _controller = Get.put(HomeScreenController());
  DetailRestaurantController _detailController = Get.put(DetailRestaurantController());
  AppBar _buildAppBar() {
    return AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue, Colors.cyan],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight)),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.location_on),
          SizedBox(width: 8.0),
          RichText(
            text: TextSpan(
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400, fontSize: 16.0),
              children: <TextSpan>[
                TextSpan(text: 'Restaurant'),
                TextSpan(text: 'Hub', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: RefreshIndicator(
        onRefresh: () {
          return _controller.getRestaurantList();
        },
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
              child: TextFormField(
                  controller: _controller.searchController,
                  onChanged: (String value){
                    _controller.searchRestaurantList();
                  },
                  decoration: InputDecoration(
                      isDense: true,
                      hintText: "Cari ...",
                      contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(color: Colors.blue),
                      ))),
            ),
            Expanded(
              child: Obx(() {
                if (_controller.response.value.status == Status.COMPLETED) {
                  return ListView.builder(
                      itemCount: _controller.dataList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            _detailController.getRestaurantList(_controller.dataList[index].id!);
                            Get.to(DetailRestaurantScreen());
                          },
                          child: restoInfoCard(_controller.dataList[index]),
                        );
                      });
                } else if (_controller.response.value.status == Status.ERROR) {
                  return ListView(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height / 3),
                      Center(child: Text(_controller.response.value.message)),
                    ],
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
