import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_access_token_app/modules/admin/post/post_controller.dart';

class PostView extends GetView<PostController> {
  const PostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.cyan,
          title: Text("List Post", style: TextStyle(color: Colors.white)),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: controller.loading.value == true
              ? Center(child: CircularProgressIndicator(color: Colors.cyan))
              : ListView.builder(
                  itemCount: controller.postList.length,
                  itemBuilder: (context, index) {
                    var data = controller.postList[index];
                    return Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.network("${data.image}"),
                          Text("${data.title}"),
                        ],
                      ),
                    );
                  },
                ),
        ),
      );
    });
  }
}
