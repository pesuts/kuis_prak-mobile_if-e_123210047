import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:kuis_123210047/groceries.dart';

class DetailScreen extends StatefulWidget {
  final Groceries grocery;

  const DetailScreen({super.key, required this.grocery});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.grocery.name,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_outline,
                color: Colors.white,
              )),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: SingleChildScrollView(
          // child: Container(
          // color: Colors.blue,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 300,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  // controller: ScrollController(),
                  // child: ,
                  child: Row(
                    children: [
                      Image.network(widget.grocery.productImageUrls[0]),
                      Image.network(widget.grocery.productImageUrls[1]),
                      Image.network(widget.grocery.productImageUrls[2]),
                    ],
                  ),
                ),
                // child: Image.network(widget.grocery.productImageUrls[0]),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        widget.grocery.name,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Rp. ${widget.grocery.price}",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 25),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text("Diskon ${widget.grocery.discount}",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      RatingBar.builder(
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                        initialRating:
                            double.parse(widget.grocery.reviewAverage),
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemBuilder: (context, index) {
                          return Icon(
                            Icons.star,
                            color: Colors.amber,
                          );
                        },
                        itemCount: 5,
                      ),
                      Text(
                        " | Tersedia: ${widget.grocery.stock}",
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(vertical: 25),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          border: Border.symmetric(
                              horizontal:
                                  BorderSide(color: Colors.grey, width: 2))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(Icons.store),
                            Text(
                              widget.grocery.storeName,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      )),
                  Text(widget.grocery.description),
                  SizedBox(
                    height: 100,
                  )
                ],
              ),
            ],
          ),

          // ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _launchUrl(widget.grocery.productUrl);
        },
        backgroundColor: Colors.green,
        child: Icon(
          Icons.open_in_browser,
          color: Colors.white,
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);

    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
