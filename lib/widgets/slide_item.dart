import 'package:flutter/material.dart';
import 'package:batterylevel/model/slide.dart';

class SlideItem extends StatelessWidget {
  final int index;
  SlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      runSpacing: 50.0,
      direction: Axis.horizontal,
      children: <Widget>[
        Container(
          width: 200,
          height: 150,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(slideList[index].imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(
          slideList[index].description,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18.0),
          textWidthBasis: TextWidthBasis.values[0],
        ),
      ],
    );
  }
}