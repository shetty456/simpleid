import 'package:flutter/material.dart';
import 'package:simple_id/src/experimentation/data/FoodItems.dart';

class ResponsiveGrid extends StatefulWidget {
  const ResponsiveGrid({super.key});

  @override
  State<ResponsiveGrid> createState() => _ResponsiveGridState();
}

class _ResponsiveGridState extends State<ResponsiveGrid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Grid Here'),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                itemBuilder: (context, index) => _cardContent(index),
                itemCount: foodItems.length,
              ));
        } else {
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                itemBuilder: (context, index) => _cardContent(index),
                itemCount: foodItems.length,
              ));
        }
      }),
    );
  }
}

Widget _cardContent(index) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.blue.shade100,
      borderRadius: const BorderRadius.all(
        Radius.circular(10.0),
      ),
    ),
    child: Column(
      children: [
        Expanded(
          child: Image.network(
            foodItems[index].imageurl,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          foodItems[index].title,
        ),
        Text(
          foodItems[index].subtitle,
        ),
      ],
    ),
  );
}
