import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingCube extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: SpinKitCubeGrid(
          color: Colors.pink[100],
          size: 50.0,
        ),
      ),
    );
  }
}

class LoadingRipple extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: SpinKitRipple(
          color: Colors.blue[300],
          size: 50.0,
        ),
      ),
    );
  }
}

class LoadingFadingCube extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: SpinKitFadingCube(
          color: Colors.blue[300],
          size: 50.0,
        ),
      ),
    );
  }
}