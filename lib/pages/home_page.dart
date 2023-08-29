import 'package:flutter/material.dart';
import 'package:food_order/model/category_list.dart';
import 'package:food_order/model/food_lists.dart';
import 'package:food_order/widgets/category_card.dart';
import 'package:food_order/widgets/filter_buttion.dart';
import 'package:food_order/widgets/food_cart.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          children: [
            buildHeader(),
            SizedBox(height: 20),
            buildSearch(),
            SizedBox(height: 20),
            buildFilter(),
            SizedBox(height: 20),
            buildFoodList(),
            SizedBox(height: 20),
            buidlSectionTitle(),
            buildCategoryList(),
          ],
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu),
            ),
            CircleAvatar(
              backgroundImage:
                  NetworkImage("https://source.unsplash.com/200x200/?man"),
            ),
          ],
        ),
        SizedBox(height: 16),
        Text(
          "Hello X,",
          style: TextStyle(fontSize: 16.0, color: Colors.black54),
        ),
        Text(
          "Food Delivery",
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Widget buildSearch() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(6),
                hintText: "Search food",
                suffixIcon: Icon(Icons.search),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
          ),
        ),
        Card(
          margin: EdgeInsets.only(left: 12),
          color: Colors.green,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.filter_list_alt,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget buildFilter() {
    return Container(
      height: 32,
      child: ListView(
        scrollDirection: Axis.horizontal, // scroll from left to right
        children: [
          FilterButton(title: "Popular", isSelected: true),
          FilterButton(title: "New Items", isSelected: false),
          FilterButton(title: "Hot Deals", isSelected: false),
          FilterButton(title: "Cambo Packs", isSelected: false),
        ],
      ),
    );
  }

  Widget buildFoodList() {
    return Container(
        height: 220,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: foodList.length,
          itemBuilder: (context, index) {
            FoodModel food = foodList[index];
            return FoodCard(food: food);
          },
        ));
  }

  Widget buidlSectionTitle() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Explore Categories",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  "View all",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ))
          ],
        ),
      ],
    );
  }

  Widget buildCategoryList() {
    return GridView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: categories.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 16 / 6,
      ),
      itemBuilder: (context, index) {
        final Category category = categories[index];
        return CategoryCard(category: category);
      },
    );
  }

}
