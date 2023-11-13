//import 'dart:js';

//import 'package:afisha_web/routing_data.dart';
import 'package:afisha_web/const/const_variables.dart';
import 'package:afisha_web/routing_data.dart';
import 'package:afisha_web/screens/library_structure/structure_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:provider/provider.dart';

class PageStruct extends StatelessWidget {
  PageStruct({Key? key}) : super(key: key);

  final PageController _controller = PageController(initialPage: 0);
  static const int itemCnt = 8;
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
                  if (index == 0) ...[
                    Opacity(
                        opacity: 1.0,
                        child: StructureContent(
                            borderSq: StructureData.colorRed,
                            img: StructureData.meetingEventHall,
                            borderType: StructureData.redBookmark,
                            eventHead: StructureData.roomMeetingEventHead,
                            event: StructureData.roomMeetingEvent))
                  ] else if (index == 1) ...[
                    Opacity(
                        opacity: 1.0,
                        child: StructureContent(
                            borderSq: StructureData.colorLiteBlue,
                            img: StructureData.smallKidsHall,
                            borderType: StructureData.liteBlueBookmark,
                            eventHead: StructureData.roomReadersHead,
                            event: StructureData.roomReaders))
                  ] else if (index == 2) ...[
                    Opacity(
                        opacity: 1.0,
                        child: StructureContent(
                            borderSq: StructureData.colorYellow,
                            img: StructureData.sectorOperatinsInfoHall,
                            borderType: StructureData.yellowBookmark,
                            eventHead: StructureData.sectorOperatinsInfoHead,
                            event: StructureData.sectorOperatinsInfo))
                  ] else if (index == 3) ...[
                    Opacity(
                        opacity: 1.0,
                        child: StructureContent(
                            borderSq: StructureData.colorMaroon,
                            img: StructureData.freeReadersPlaceHall,
                            borderType: StructureData.maroonBookmark,
                            eventHead: StructureData.freeReadersPlaceHead,
                            event: StructureData.freeReadersPlace))
                  ] else if (index == 4) ...[
                    Opacity(
                        opacity: 1.0,
                        child: StructureContent(
                            borderSq: StructureData.colorOrange,
                            img: StructureData.silendHoleHall,
                            borderType: StructureData.orangeBookmark,
                            eventHead: StructureData.silendHoleHeader,
                            event: StructureData.silendHole))
                  ] else if (index == 5) ...[
                    Opacity(
                        opacity: 1.0,
                        child: StructureContent(
                            borderSq: StructureData.colorGreen,
                            img: StructureData.roomTransformerHall,
                            borderType: StructureData.greenBookmark,
                            eventHead: StructureData.roomTransformerHeader,
                            event: StructureData.roomTransformer))
                  ] else if (index == 6) ...[
                    Opacity(
                        opacity: 1.0,
                        child: StructureContent(
                            borderSq: StructureData.colorTeen,
                            img: StructureData.smallRoomTeenClubHall,
                            borderType: StructureData.teenBookmark,
                            eventHead: StructureData.smallRoomTeenClubHeader,
                            event: StructureData.smallRoomTeenClub))
                  ] else if (index == 7) ...[
                    Opacity(
                        opacity: 1.0,
                        child: StructureContent(
                            borderSq: StructureData.colorBlue,
                            img: StructureData.experimentalStationHall,
                            borderType: StructureData.blueBookmark,
                            eventHead: StructureData.experimentalStationHeader,
                            event: StructureData.experimentalStation))
                  ] else if (index == 8) ...[
                    Opacity(
                        opacity: 1.0,
                        child: StructureContent(
                            borderSq: StructureData.colorWhite,
                            img: StructureData.coordinationDepartment,
                            borderType: StructureData.whiteBookmark,
                            eventHead:
                                StructureData.coordinationDepartmentHeader,
                            event: StructureData.coordinationDepartmentA))
                  ] else ...[
                    const SizedBox.shrink()
                  ],

                  /*
                    Container(
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
                    */

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
