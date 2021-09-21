import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_hub/data/response_restaurant.dart';

class DetailRestaurantScreen extends StatefulWidget {
  const DetailRestaurantScreen(this.restaurants, {Key? key}) : super(key: key);
  final Restaurants restaurants;

  @override
  _DetailRestaurantScreenState createState() => _DetailRestaurantScreenState();
}

class _DetailRestaurantScreenState extends State<DetailRestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImage(),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(widget.restaurants.name,
                        style: GoogleFonts.poppins(
                            color: Colors.black87,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w700)),
                  ),
                  Icon(Icons.star, color: Colors.blue, size: 16.0),
                  Text(widget.restaurants.rating.toString(),
                      style: GoogleFonts.poppins(
                          color: Colors.blue,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(widget.restaurants.city,
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
                        itemCount: widget.restaurants.menus.foods.length,
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
                              widget.restaurants.menus.foods[index].name,
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
                        itemCount: widget.restaurants.menus.drinks.length,
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
                                  widget.restaurants.menus.drinks[index].name,
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
              child: Text(widget.restaurants.description,
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.poppins(
                      color: Colors.black87,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16.0),
              bottomRight: Radius.circular(16.0)),
          child: Image.network(widget.restaurants.pictureId,
              height: 240, width: double.infinity, fit: BoxFit.cover),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(Icons.chevron_left, color: Colors.white)),
          ),
        )
      ],
    );
  }
}
