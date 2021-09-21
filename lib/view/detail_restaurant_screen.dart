import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_hub/controller/detail_restaurant_controller.dart';
import 'package:restaurant_hub/data/response.dart';

class DetailRestaurantScreen extends StatelessWidget {
  DetailRestaurantController _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx((){
        if(_controller.response.value.status == Status.COMPLETED){
          return ListView(
            children: [
              _buildImage(),
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(_controller.restaurant.name!,
                          style: GoogleFonts.poppins(
                              color: Colors.black87,
                              fontSize: 24.0,
                              fontWeight: FontWeight.w700)),
                    ),
                    Icon(Icons.star, color: Colors.blue, size: 16.0),
                    Text(_controller.restaurant.rating.toString(),
                        style: GoogleFonts.poppins(
                            color: Colors.blue,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(_controller.restaurant.city!,
                    style: GoogleFonts.poppins(
                        color: Colors.black54,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Text("Makanan",
                          style: GoogleFonts.poppins(
                              color: Colors.black54,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500)),
                    ),
                    Container(
                      height: 48,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _controller.restaurant.menus!.foods!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(8.0))),
                              margin: EdgeInsets.all(4.0),
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              height: 48,
                              child: Center(
                                  child: Text(
                                    _controller.restaurant.menus!.foods![index].name!,
                                    style: GoogleFonts.poppins(color: Colors.white,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w600),
                                  )),
                            );
                          }),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Text("Minuman",
                          style: GoogleFonts.poppins(
                              color: Colors.black54,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500)),
                    ),
                    Container(
                      height: 48,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _controller.restaurant.menus!.drinks!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(8.0))),
                              margin: EdgeInsets.all(4.0),
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              height: 48,
                              child: Center(
                                  child: Text(
                                    _controller.restaurant.menus!.drinks![index].name!,
                                    style: GoogleFonts.poppins(color: Colors.white,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w600),
                                  )),
                            );
                          }),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(_controller.restaurant.description!,
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.poppins(
                        color: Colors.black87,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500)),
              ),
            ],
          );
        } else if(_controller.response.value.status == Status.ERROR){
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
    );
  }

  Widget _buildImage() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16.0),
              bottomRight: Radius.circular(16.0)),
          child: Image.network('https://restaurant-api.dicoding.dev/images/medium/' + _controller.restaurant.pictureId!,
              height: 240, width: double.infinity, fit: BoxFit.cover),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: InkWell(
            onTap: () => Navigator.pop(Get.context!),
            child: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(Icons.chevron_left, color: Colors.white)),
          ),
        )
      ],
    );
  }
}
