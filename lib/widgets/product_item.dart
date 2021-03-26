import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resturant_ui_challenge/util/const.dart';
import 'package:resturant_ui_challenge/widgets/smooth_star_rating.dart';

class ProductItem extends StatelessWidget {
  final String name;
  final String img;
  final bool isFav;
  final double rating;
  final int raters;
  final double heightDivident;
  final double widthDivident;

  const ProductItem(
      {Key key,
      this.name,
      this.img,
      this.isFav,
      this.rating,
      this.raters,
      this.heightDivident = 1.0,
      this.widthDivident = 1.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / heightDivident,
              width: MediaQuery.of(context).size.width / widthDivident,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  img,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              right: -10,
              bottom: 3,
              child: RawMaterialButton(
                onPressed: () {},
                fillColor: Colors.white,
                shape: CircleBorder(),
                elevation: 4.0,
                child: Icon(
                  isFav ? Icons.favorite : Icons.favorite_border,
                  color: Colors.red,
                  size: 17,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 2.0, top: 8.0, left: 8),
          child: Text(
            name,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 2.0, top: 8.0, left: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SmoothStarRating(
                starCount: 5,
                color: Constants.ratingBG,
                allowHalfRating: true,
                rating: rating,
                size: 10.0,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                rating.toString(),
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontSize: 10),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "(${raters.toString()} Reviewers)",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontSize: 10),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
