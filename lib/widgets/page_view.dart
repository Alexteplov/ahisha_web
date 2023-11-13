//import 'dart:js';

//import 'package:afisha_web/routing_data.dart';
import 'package:afisha_web/const/const_variables.dart';
import 'package:afisha_web/routing_data.dart';
import 'package:afisha_web/theme/screen.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:provider/provider.dart';

class PageViewAfisha extends StatelessWidget {
  PageViewAfisha({Key? key}) : super(key: key);

  final PageController _controller =
      PageController(initialPage: getAfishaRoute);
  static const int itemCnt = 7;
  @override
  Widget build(BuildContext context) {
    //int index = 4;
    return WillPopScope(
      onWillPop: () async {
        context.read<RoutingData>().returnBack;
        return true;
      },
      child: SafeArea(
        child: PageView.builder(
            controller: _controller,
            itemCount: itemCnt,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              //int itemCnt = 5;
              return Stack(
                children: [
                  Opacity(
                    opacity: 1.0,
                    child: Container(
                      height: Screen.height(context),
                      width: Screen.width(context),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'image/bgAfisha/schedule/${index + 1}.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  index == 0
                      ? Positioned(
                          bottom: 10,
                          left: 15,
                          child: FloatingActionButton(
                            onPressed: () => context
                                .read<RoutingData>()
                                .setRoute(GlobalVar.routeMainMenu),
                            backgroundColor: Colors.red,
                            child: const FittedBox(
                              child: Icon(
                                Icons.home,
                                size: 44,
                              ),
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(itemCnt, (i) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: index == i ? Colors.blue : Colors.grey),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}

int get getAfishaRoute {
  DateTime now =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  //DateTime _sDt = DateTime(2021, 12, 24);
  //Show default page. It's the last page.
  int retStr = 6;
  if (now.compareTo(DateTime(2023, 11, 12)) <= 0) {
    retStr = 0;
  } else if (now.compareTo(DateTime(2023, 11, 14)) <= 0) {
    retStr = 1;
  } else if (now.compareTo(DateTime(2023, 11, 15)) <= 0) {
    retStr = 2;
  } else if (now.compareTo(DateTime(2023, 11, 16)) <= 0) {
    retStr = 3;
  } else if (now.compareTo(DateTime(2023, 11, 17)) <= 0) {
    retStr = 4;
  } else if (now.compareTo(DateTime(2023, 11, 18)) <= 0) {
    retStr = 5;
  } else if (now.compareTo(DateTime(2023, 11, 19)) <= 0) {
    retStr = 6;
  }
  /*
  else if (now.compareTo(DateTime(2023, 07, 29)) <= 0) {
    _retStr = 7;
  } else if (now.compareTo(DateTime(2023, 07, 30)) <= 0) {
    _retStr = 8;
  }
  */
  return retStr;
}
