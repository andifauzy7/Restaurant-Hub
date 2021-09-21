import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_hub/data/response_restaurant_list.dart';

Widget restoInfoCard(Restaurant restaurants){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Container(
      decoration: BoxDecoration(
          color: Colors.blue[50],
          borderRadius: BorderRadius.circular(16.0)),
      margin: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: ClipRRect(
              borderRadius:
              BorderRadius.all(Radius.circular(16.0)),
              child: Image.network(
                  'https://restaurant-api.dicoding.dev/images/medium/' + restaurants.pictureId!,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(width: 8.0),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                          restaurants.name!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                              color: Colors.black87,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700)),
                    ),
                    Icon(Icons.star, color: Colors.blue, size: 14.0),
                    Text(
                        restaurants.rating
                            .toString(),
                        style: GoogleFonts.poppins(
                            color: Colors.blue,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w700)),
                    SizedBox(width: 16.0),
                  ],
                ),
                Text(
                    restaurants.city!,
                    style: GoogleFonts.poppins(
                        color: Colors.black54,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500)),
                Text(
                    restaurants.description!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                        color: Colors.black87,
                        fontSize: 12.0)),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}