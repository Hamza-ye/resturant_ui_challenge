import 'package:flutter/material.dart';

class HomeCategory extends StatelessWidget {
  final IconData icon;
  final String title;
  final int items;

  const HomeCategory({Key key, this.icon, this.title, this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    return InkWell(
      onTap: () {},
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 5.0,
        child: Container(
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 0.0, right: 10),
                child: Icon(
                  icon,
                  color: Theme.of(context).accentColor,
                ),
              ),
              SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 10.0),
                  Text(
                    title,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${items.toString()} items',
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
