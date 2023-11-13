//import 'dart:html';

//import 'dart:js';

import 'package:afisha_web/const/const_variables.dart';
import 'package:afisha_web/routing_data.dart';
import 'package:afisha_web/theme/screen.dart';
import 'package:afisha_web/widgets/current_date.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

class MainAppBar extends AppBar {
  final BuildContext context;

  MainAppBar(this.context, {Key? key})
      : super(
          toolbarHeight: Screen.height(context) >= Screen.width(context)
              ? Screen.height(context) / 12
              : Screen.width(context) / 12,
          key: key,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          backgroundColor: Colors.white70,
          centerTitle: true,
          leading: GestureDetector(
            onTap: () =>
                context.read<RoutingData>().setRoute(GlobalVar.routeMainMenu),
            child: FittedBox(
                fit: BoxFit.fitHeight,
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  GlobalVar.logoAppBar,
                )),
          ),
          //leadingWidth: Screen.width(context),
          title: FittedBox(
            fit: BoxFit.fitHeight,
            alignment: Alignment.bottomCenter,
            child: Text(
              Screen.height(context) >= Screen.width(context)
                  ? GlobalVar.nameLib
                  : GlobalVar.nameLibLong,
              style: GoogleFonts.oswald(
                textStyle: Screen.height(context) >= Screen.width(context)
                    ? Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: Colors.black87)
                    : Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: Colors.black87),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          elevation: 0.0,
          automaticallyImplyLeading: false,
          actions: <Widget>[
            CurrentDate(context: context),
          ],
        );
}
