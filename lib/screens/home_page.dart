import 'package:flutter/material.dart';
import 'package:resturant_ui_challenge/util/categories.dart';
import 'package:resturant_ui_challenge/util/foods.dart';
import 'package:resturant_ui_challenge/widgets/home_category.dart';
import 'package:resturant_ui_challenge/widgets/product_item.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _current = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Dishes',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                FlatButton(
                  child: Text(
                    "View More",
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height / 2.4,
                autoPlay: true,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
                // enlargeCenterPage: true,
                // aspectRatio: 2.0,
              ),
              items: map<Widget>(foods, (index, i) {
                Map food = foods[index];
                return InkWell(
                  child: ProductItem(
                    img: food['img'],
                    isFav: false,
                    name: food['name'],
                    rating: 4.0,
                    raters: 23,
                    heightDivident: 3.2,
                  ),
                  onTap: () {},
                );
              }).toList(),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Food Categories",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              height: 65.0,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: categories == null ? 0 : categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext ctx, int index) {
                  Map cat = categories[index];
                  return HomeCategory(
                    icon: cat['icon'],
                    title: cat['name'],
                    items: cat['items'],
                  );
                },
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Popular Items',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                FlatButton(
                  child: Text(
                    "View More",
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            GridView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: foods.length,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.25),
              ),
              itemBuilder: (context, index) {
                Map food = foods[index];
                return InkWell(
                  child: ProductItem(
                    img: food['img'],
                    isFav: false,
                    name: food['name'],
                    rating: 4.5,
                    raters: 23,
                    heightDivident: 3.6,
                    widthDivident: 2.2,
                  ),
                  onTap: () {},
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
