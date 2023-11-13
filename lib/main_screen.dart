import 'package:afisha_web/routing_data.dart';
import 'package:afisha_web/widgets/main_appbar.dart';
import 'package:flutter/material.dart';

// ignore: implementation_imports
import 'package:provider/src/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //context.watch<RoutingData>().setContext(context);
    return Scaffold(
//      backgroundColor: Colors.blueGrey.shade200,
      appBar: MainAppBar(context),
      body: context.watch<RoutingData>().getWidget,
      //floatingActionButton: context.watch<RoutingData>().getLowerNavigation,
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      //RoutingData().getWidget,
    );
  }
}
