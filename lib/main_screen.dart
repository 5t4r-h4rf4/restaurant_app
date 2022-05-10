import 'package:flutter/material.dart';
import 'package:restaurant_app/detail_screen.dart';
import 'package:restaurant_app/model/data_restaurant.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 180,
        backgroundColor: Colors.white,
        title: RichText(
          text: TextSpan(
              text: "Restaurant App",
              style: TextStyle(fontSize: 32, color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                  text: '\nRecommendation restaurant for you!',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ]),
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraint) {
          if (constraint.maxWidth <= 600) {
            return RestaurantList();
          } else if (constraint.maxWidth <= 1200) {
            return RestaurantGrid(gridCount: 4);
          } else {
            return RestaurantGrid(gridCount: 6);
          }
        },
      ),
    );
  }
}

class RestaurantList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final RestaurantPlace place = restaurantPlaceList[index];
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailScreen(place: place);
            }));
          },
          child: Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 150,
                  height: 100,
                  margin: EdgeInsets.all(8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      image: AssetImage(place.pictId),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          place.name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.location_on_outlined),
                            Text(place.city),
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.star),
                            Text(place.rating),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: restaurantPlaceList.length,
    );
  }
}

class RestaurantGrid extends StatelessWidget {
  final int gridCount;

  RestaurantGrid({required this.gridCount});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        isAlwaysShown: true,
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: GridView.count(
            crossAxisCount: gridCount,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: restaurantPlaceList
                .map((place) => InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return DetailScreen(place: place);
                        }));
                      },
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Expanded(
                                child: Image.asset(
                              place.pictId,
                              fit: BoxFit.cover,
                            )),
                            SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: Text(
                                place.name,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8, bottom: 8),
                              child: Text(place.city),
                            )
                          ],
                        ),
                      ),
                    ))
                .toList(),
          ),
        ));
  }
}
