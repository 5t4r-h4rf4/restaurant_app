import 'package:flutter/material.dart';
import 'package:restaurant_app/model/data_restaurant.dart';

var informationTextStyle = TextStyle(fontFamily: 'Oxygen');

class DetailScreen extends StatelessWidget {
  final RestaurantPlace place;

  DetailScreen({required this.place});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth > 800) {
        return DetailScreenWeb(
          place: place,
        );
      } else {
        return DetailScreenMobile(place: place);
      }
    });
  }
}

class DetailScreenMobile extends StatelessWidget {
  final RestaurantPlace place;

  DetailScreenMobile({required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image(
                    image: AssetImage(place.pictId),
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ))),
                        FavoriteButton()
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 10),
              child: Text(
                place.name,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Staatliches',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 13, top: 5),
              child: Row(
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.location_on_outlined),
                      Text(
                        place.city,
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 13, top: 5),
              child: Row(
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.star),
                      Text(
                        place.rating,
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 18, top: 25, bottom: 25),
              child: RichText(
                text: TextSpan(
                    text: "Description \n",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: place.description,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ]),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                'Menus',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 18, top: 25, bottom: 25),
              height: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: place.imageUrls.map((url) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(url),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailScreenWeb extends StatefulWidget {
  final RestaurantPlace place;

  DetailScreenWeb({required this.place});

  @override
  _DetailScreenWebState createState() => _DetailScreenWebState();
}

class _DetailScreenWebState extends State<DetailScreenWeb> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 64),
            child: Center(
              child: Container(
                width: 1200,
                child: Column(
                  children: [
                    Text("Restaurant App",
                        style: TextStyle(
                          fontSize: 30.0,
                          fontFamily: 'Staatliches',
                        )),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              ClipRRect(
                                child: Image.asset(widget.place.pictId),
                                borderRadius: BorderRadius.circular(90),
                              ),
                              SizedBox(height: 16),
                              Container(
                                height: 150,
                                padding: const EdgeInsets.only(bottom: 16),
                                child: Scrollbar(
                                  controller: _scrollController,
                                  isAlwaysShown: true,
                                  child: ListView(
                                    controller: _scrollController,
                                    padding: EdgeInsets.only(bottom: 16),
                                    scrollDirection: Axis.horizontal,
                                    children: widget.place.imageUrls.map((url) {
                                      return Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.network(url),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Card(
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      widget.place.name,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 30.0,
                                        fontFamily: 'Staatliches',
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 16.0),
                                    child: Text(
                                      widget.place.description,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontFamily: 'Oxygen',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
          });
        },
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
        ));
  }
}
