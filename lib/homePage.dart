import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prac2/controller/callController.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final apiConrroller = Get.put(CallController());

  @override
  void initState() {
    super.initState();
    apiConrroller.manageApiCall();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (apiConrroller.userss.isEmpty) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return Center(
        child: Text(apiConrroller.userss.value[0].name.toString()),
      );
    });
  }
}
