import 'dart:math';
import 'package:drive_kg/category_page.dart';
import 'package:drive_kg/list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Random random = Random();

  final List<ListItem> category = [
    ListItem(title: 'Услуги', imagePath: 'assets/images/image1.png'),
    ListItem(
        title: 'Двигатель и запчасти', imagePath: 'assets/images/image2.png'),
    ListItem(title: 'Трансмиссия', imagePath: 'assets/images/image3.png'),
    ListItem(
        title: 'Детали, ходовой части', imagePath: 'assets/images/image4.png'),
    ListItem(
        title: 'Система охлаждения', imagePath: 'assets/images/image5.png'),
    ListItem(title: 'Рулевая часть', imagePath: 'assets/images/image6.png'),
    ListItem(title: 'Электроника', imagePath: 'assets/images/image8.png'),
    ListItem(title: 'Оптика', imagePath: 'assets/images/image9.png'),
    ListItem(
        title: 'Кузовные элементы', imagePath: 'assets/images/image10.png'),
    ListItem(title: 'Салон и интерьер', imagePath: 'assets/images/image11.png'),
    ListItem(
        title: 'Масла и автохимия', imagePath: 'assets/images/image12.png'),
    ListItem(title: 'Шины и диски', imagePath: 'assets/images/image13.png'),
    ListItem(
        title: 'Все категории',
        imagePath: ''), // Special item
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
            child: SizedBox(
              height: 300,
              child: StaggeredGrid.count(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                axisDirection: AxisDirection.right,
                children: category.map((item) {
                  final isAllCategory = item.title == 'Все категории';
                  final crossAxisCellCount =
                      isAllCategory ? 2 : 1; // туурасы чоңураак
                  final mainAxisCellCount = isAllCategory
                      ? 2
                      : (random.nextBool() ? 1 : 2); // бийиктиги чоңураак
                  return StaggeredGridTile.count(
                    crossAxisCellCount: crossAxisCellCount,
                    mainAxisCellCount: mainAxisCellCount,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      child: isAllCategory
                          ? _buildAllCategoriesInGrid(context, category)
                          : _buildCategoryItem(item),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _curcleList(),
        ],
      ),
    );
  }

  SizedBox _curcleList() {
    return SizedBox(
      height: 80,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 20,
          itemBuilder: (context, index) {
            return Container(
                width: 80,
                height: 80,
                margin: const EdgeInsets.symmetric(horizontal: 6),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                    shape: BoxShape.circle,
                    color: Colors.red),
                alignment: Alignment.center,
                child: const Text(
                  'Drive.kg',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold),
                ));
          }),
    );
  }

  Widget _buildCategoryItem(ListItem item) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CategoryPage(
              title: item.title,
              items: const [],
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                item.title,
                style: const TextStyle(color: Colors.white, fontSize: 12),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  item.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAllCategoriesInGrid(BuildContext context, List<ListItem> items) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CategoryPage(title: 'Все категория', items: items),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.apps, color: Colors.white, size: 40),
              SizedBox(height: 10),
              Text(
                'Все категории',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
