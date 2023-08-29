import 'package:flutter/material.dart';
import 'package:food_order/main.dart';
import 'package:food_order/model/food_lists.dart';

class FoodDetailPage extends StatefulWidget {
  final FoodModel food;
  const FoodDetailPage({super.key, required this.food});

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  FoodModel get food => widget.food;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          buildImage(),
          buildAppBar(),
          buildFoodInfo(),
        ],
      ),
    );
  }

  Widget buildImage() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Image.network(
        food.image,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildFoodInfo() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height / 2 - 16,
      ),
      child: Container(
        padding: EdgeInsets.all(14.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    food.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "\$ ${food.price}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Text(
                "Italian soup",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ),
            buildRatingStar(),
            buildDescription(),
          ],
        ),
      ),
    );
  }

  Widget buildRatingStar() {
    return Container(
      padding: EdgeInsets.only(top: .0),
      child: Row(
        children: [
          ...List.generate(
            5,
            (index) => Icon(
              Icons.star,
              color: Colors.amber,
              size: 18,
            ),
          ),
          Text(
            "${food.rating}",
          ),
          Text("(1k+)"),
          Spacer(),
        ],
      ),
    );
  }

  Widget buildDescription() {
    return Container(
      padding: EdgeInsets.only(top: 13.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Description",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            style: TextStyle(fontSize: 11, color: Colors.black54),
          )
        ],
      ),
    );
  }

  Widget buildAppBar() {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(top: 16.0, left: 12.0),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextButton(
              onPressed: () {},
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 16.0,
              ),
            ),
          ),
          Container(
            width: 40,
            height: 40,
            margin: EdgeInsets.only(top: 16.0, right: 12.0),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(40),
            ),
            child: TextButton(
              onPressed: () {},
              child: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
