import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_hub/components/resto_info_card.dart';
import 'package:restaurant_hub/data/request_data.dart';
import 'package:restaurant_hub/data/response_restaurant.dart';
import 'package:restaurant_hub/view/detail_restaurant_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ResponseRestaurant? responseRestaurant;
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
                new TextSpan(text: 'Restaurant'),
                new TextSpan(
                    text: 'Hub',
                    style: new TextStyle(fontWeight: FontWeight.bold)),
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
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
            child: TextFormField(
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
            child: FutureBuilder(
                future: RequestData.getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    responseRestaurant = snapshot.data as ResponseRestaurant?;
                    return (responseRestaurant != null)
                        ? ListView.builder(
                            itemCount: responseRestaurant!.restaurants.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DetailRestaurantScreen(
                                                  responseRestaurant!
                                                      .restaurants[index])));
                                },
                                child: restoInfoCard(
                                    responseRestaurant!.restaurants[index]),
                              );
                            })
                        : Center(child: Text("Data kosong ..."));
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          ),
        ],
      ),
    );
  }
}
