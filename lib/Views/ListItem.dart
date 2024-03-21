import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kuis_123210047/groceries.dart';
import 'package:kuis_123210047/Views/DetailNonFavorite.dart';

class ListItem extends StatefulWidget {
  const ListItem({super.key});

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("KUIS TPM IF-E"),
      ),
      body: Container(
        child: GridView.builder(
          // shrinkWrap: true,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            return CardItem(grocery: groceryList[index]);
          },
          itemCount: groceryList.length,
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final Groceries grocery;

  const CardItem({super.key, required this.grocery});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // print(grocery.name);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailScreen(grocery: grocery)));
      },
      child: SingleChildScrollView(
        // height: 800,
        child: Card(
          margin: EdgeInsets.all(15),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: [
              Image.network(
                grocery.productImageUrls[0],
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              Container(
                // height: 150,
                child: Text(grocery.name),
              ),
              Text(
                "Rp. ${grocery.price}",
                style: TextStyle(
                    fontWeight: FontWeight.w700, fontSize: 15),
              ),
              Container(
                padding:
                EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text("Diskon ${grocery.discount}",
                    style: TextStyle(color: Colors.white)),
              ),
              RatingBar.builder(
                onRatingUpdate: (rating) {
                  print(rating);
                },
                initialRating:
                double.parse(grocery.reviewAverage),
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
            ],
          ),
        ),
      ),
    );
  }
}
