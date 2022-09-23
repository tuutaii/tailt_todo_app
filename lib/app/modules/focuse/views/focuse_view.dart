import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/focuse_controller.dart';

class FocuseView extends GetView<FocuseController> {
  const FocuseView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FocuseView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FocuseView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
