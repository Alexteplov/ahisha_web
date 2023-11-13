import 'dart:io';

import 'package:afisha_web/application.dart';
import 'package:afisha_web/routing_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:path/path.dart' as p;

main() async {
  // ignore: avoid_print
  //print(allContents);

  //print("+");
  /*
  Future<List<File>> future =
      getAllFilesWithExtension('assets/image/bgAfisha/shedule', 'jpg');
  future.then((List<File> data) {
    print('----');
    print(data.join(','));
  }); */
  // print("+");
  /*
  var isAlive;
  

  file.exists();

  print("+++");
  print(isAlive);
 */
//  print(getImageProvider(file));
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => RoutingData(_)),
    ],
    child: const Application(),
  ));
}

Object getImageProvider(File f) {
  return f.existsSync()
      ? FileImage(f)
      : const AssetImage('images/fallback.png');
}
