import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Manager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 110,
          width: 370,
          decoration: BoxDecoration(
            color: (Colors.amberAccent),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1),
                  itemBuilder: (context, index) => Itemcard())),
        )
      ],
    );
  }
}

class Itemcard extends StatelessWidget {
  const Itemcard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          children: [Text("data")],
        ),
        Row(
          children: [Text("data")],
        ),
        Row(
          children: [Text("data")],
        )
      ],
    );
  }
}
