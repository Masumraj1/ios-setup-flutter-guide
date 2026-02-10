import 'package:flutter/material.dart';

class ClippathScreen extends StatelessWidget {
  const ClippathScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height =MediaQuery.of(context).size.height;
    double width =MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
         body: ClipPath(
            clipper: KiteCliper(),
           child: Container(
                  height: height,
                  width: width,
                  color: Colors.red,
           ),
         ),
      ),
    );
  }
}


class KiteCliper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width * 0.5, 0);
    path.lineTo(size.width * 0.3, size.height * 0.3);
    path.lineTo(size.width * 0.5, size.height * 0.6);
    path.lineTo(size.width * 0.4, size.height * 0.7);
    // path.lineTo(size.width * 0.6, size.height * 0.7);
    // path.lineTo(size.width * 0.5, size.height * 0.6);
    // path.lineTo(size.width * 0.7, size.height * 0.3);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
  
}