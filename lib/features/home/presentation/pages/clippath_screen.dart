import 'package:flutter/material.dart';

class ClippathScreen extends StatelessWidget {
  const ClippathScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height =MediaQuery.of(context).size.height/7;
    double width =MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(120), // এখানে আপনার ইচ্ছামতো হাইট দিন (যেমন: ১০০)
            child: ClipPath(
              clipper: CurveClipper(),
              child: Container(
                height: height,
                width: width,
                color: const Color(0xFF32A47F),
                child: Padding(
                  padding: const EdgeInsets.all(22),
                  child: Text(
                    "DashBoard",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ),
          ),

      )
    );
  }
}
class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    // ১. বাম পাশে উপর থেকে নিচ পর্যন্ত একটি সোজা লাইন (একটু গ্যাপ রেখে)
    path.lineTo(0, size.height - 50);

    // ২. প্রথম কার্ভের পয়েন্ট (বাম থেকে মাঝখান পর্যন্ত)
    // Control Point-টি নিচে নামালে ডিজাইনটি নিচের দিকে ঝুলে থাকবে।
    var firstControlPoint = Offset(size.width * 0.25, size.height);
    var firstEndPoint = Offset(size.width * 0.5, size.height); // মাঝখানে আবার উপরের দিকে ফিরে যাবে

    // ৩. দ্বিতীয় কার্ভের পয়েন্ট (মাঝখান থেকে শেষ পর্যন্ত)
    // দ্বিতীয় কন্ট্রোল পয়েন্টটিও নিচে রাখা হয়েছে যাতে ডান পাশটিও সমানভাবে ঝুলে থাকে।
    var secondControlPoint = Offset(size.width * 0.75, size.height);
    var secondEndPoint = Offset(size.width, size.height - 50); // একদম ডানে গিয়ে শেষ হবে

    // ৪. প্রথম কার্ভ আঁকা
    path.quadraticBezierTo(
        firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy
    );

    // ৫. দ্বিতীয় কার্ভ আঁকা
    path.quadraticBezierTo(
        secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy
    );

    // ৬. একদম ডান পাশের কোণা থেকে সোজা উপরে (Top-Right) ফিরে যাওয়া
    path.lineTo(size.width, 0);

    // ৭. পাথটি বন্ধ করা
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}