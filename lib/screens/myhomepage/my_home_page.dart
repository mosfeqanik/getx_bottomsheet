import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_bottomsheet/screens/myhomepage/theme_controller.dart';

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({Key? key,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          GetBuilder<ThemeController>(
            builder: (controller) => IconButton(
              icon: Icon(
                controller.isDarkMode ? Icons.dark_mode : Icons.light_mode,
              ),
              onPressed: () => controller.toggleDarkMode(),
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.black87,
                border: Border.all(
                  color: Colors.black87,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: TextButton(
                child: const Text(
                  'Show bottomSheet',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Get.bottomSheet(
                      Wrap(
                        children: [
                          ListTile(
                            leading: Icon(Icons.wb_sunny_outlined),
                            title: Text('Light Theme'),
                            onTap: () => {Get.changeTheme(ThemeData.light())},
                          ),
                          ListTile(
                            leading: Icon(Icons.wb_sunny),
                            title: Text('Dark Theme'),
                            onTap: () => {Get.changeTheme(ThemeData.dark())},
                          ),
                        ],
                      ),
                      barrierColor: Colors.greenAccent.shade100);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
