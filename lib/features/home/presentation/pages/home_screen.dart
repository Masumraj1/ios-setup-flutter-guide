import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qorum/features/home/presentation/controller/home_controller.dart';

import 'clippath_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final HomeController controller = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(title: const Text('Home'), centerTitle: true),

      // body: Obx(() {
      //   if (controller.isLoading.value) {
      //     return const Center(child: CircularProgressIndicator());
      //   }
      //
      //   return ListView.builder(
      //     itemCount: controller.posts.length,
      //     itemBuilder: (context, index) {
      //       final post = controller.posts[index];
      //
      //       return ListTile(
      //         leading: const Icon(Icons.article),
      //         title: Text(post['title']),
      //         subtitle: Text(post['body']),
      //       );
      //     },
      //   );
      // }),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder:
                  (buildContext) => ClippathScreen()),
            );
          },
          child: Text('Go'),
        ),
      ),
    );
  }
}
