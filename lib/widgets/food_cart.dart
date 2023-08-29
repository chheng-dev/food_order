import 'package:flutter/material.dart';
import 'package:food_order/main.dart';
import 'package:food_order/model/food_lists.dart';
import 'package:food_order/pages/food_detail_page.dart';

class FoodCard extends StatelessWidget {
  final FoodModel food;
  const FoodCard({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FoodDetailPage(
            food: food,
          ),
        ));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7, // 70% of screen
        child: Container(
          margin: EdgeInsets.only(right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildImageFood(),
              SizedBox(height: 10),
              buildImageInfo(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImageFood() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            food.image,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12)),
                padding:
                    EdgeInsets.only(left: 12, right: 12, top: 3, bottom: 3),
                margin: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 14,
                    ),
                    Text(
                      "1k+",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    )
                  ],
                ),
              ),
              Container(
                height: 30,
                width: 30,
                margin: EdgeInsets.only(right: 8.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 14,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget buildImageInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          food.name,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        Text(
          "\$ ${food.price}",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
