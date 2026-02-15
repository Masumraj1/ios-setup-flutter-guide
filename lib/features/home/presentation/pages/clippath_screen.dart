

import 'package:flutter/material.dart';


class ClippathScreen extends StatelessWidget {
  const ClippathScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double headerHeight = 200;

    return Scaffold(
      // backgroundColor: Colors.white,
      body: SingleChildScrollView( // পুরো স্ক্রিন স্ক্রল করার সুবিধার জন্য
        child: Column(
          children: [
            // ১. হেডার এবং কার্ডের জন্য স্ট্যাক
            SizedBox(
              height: headerHeight + 80, // হেডার + কার্ডের অর্ধেক উচ্চতা
              child: Stack(
                children: [
                  // সবুজ হেডার
                  ClipPath(
                    clipper: CurveClipper(),
                    child: Container(
                      height: headerHeight,
                      width: double.infinity,
                      color: const Color(0xFF32A47F),
                      padding: const EdgeInsets.only(top: 60, left: 25),
                      child: const Text(
                        "DashBoard",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                  // কার্ড সেকশন
                  Positioned(
                    top: headerHeight - 70,
                    left: 0,
                    right: 0,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          statusCard("Pending", "47", Colors.orange),
                          statusCard("Approved", "933", Colors.teal),
                          statusCard("Rejected", "41", Colors.red),
                          statusCard("All", "41", Colors.blue),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ২. বাকি উইজেটগুলো এখানে সিরিয়ালি বসান
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Recent Activity",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),

                  // উদাহরণস্বরূপ কিছু লিস্ট আইটেম
                  ListView.builder(
                    shrinkWrap: true, // কলামের ভেতরে লিস্ট দেখানোর জন্য জরুরি
                    physics: const NeverScrollableScrollPhysics(), // মেইন স্ক্রিন স্ক্রল করবে
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: ListTile(
                          leading: const CircleAvatar(backgroundColor: Color(0xFF32A47F)),
                          title: Text("Task Item ${index + 1}"),
                          subtitle: const Text("Description of the activity..."),
                          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // আপনার statusCard উইজেটটি এখানে থাকবে...
  Widget statusCard(String title, String count, Color color) {
    return Container(
      width: 100,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3))
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 40,
            width: double.infinity,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            alignment: Alignment.center,
            child: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(count, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: color)),
          ),
        ],
      ),
    );
  }
}

// আপনার CurveClipper ক্লাসটি এখানে থাকবে...

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