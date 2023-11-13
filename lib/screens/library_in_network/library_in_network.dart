//Библиотека в сети
import 'package:afisha_web/const/const_variables.dart';
import 'package:afisha_web/routing_data.dart';
import 'package:afisha_web/theme/screen.dart';
import 'package:afisha_web/widgets/library_logo.dart';
import 'package:afisha_web/widgets/menu_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class LibraryInNetwork extends StatelessWidget {
  const LibraryInNetwork({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            height: Screen.height(context),
            width: Screen.width(context),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(GlobalVar.bgImage),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const LibraryLogo(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //MainMenu(),
                MenuButton(
                  context: context,
                  nameButton: GlobalVar.libInNet,
                  route: GlobalVar.routeLib,
                  logo: GlobalVar.logoLibInNet,
                ),
                const SizedBox(
                  height: 20,
                ),
                MenuButton(
                  context: context,
                  nameButton: GlobalVar.inContact,
                  route: GlobalVar.routeInContact,
                  logo: GlobalVar.logoInContact,
                ),
                const SizedBox(
                  height: 20,
                ),

                MenuButton(
                  context: context,
                  nameButton: GlobalVar.odnoklassniki,
                  route: GlobalVar.routeOdnoklassniki,
                  logo: GlobalVar.logoOdnoklassniki,
                ),
                /*
                const SizedBox(
                  height: 20,
                ),
                */
/*                 MenuButton(
                  context: context,
                  nameButton: GlobalVar.tiktok,
                  route: GlobalVar.routeTikTok,
                  logo: GlobalVar.logoTiktok,
                ),
                const SizedBox(
                  height: 20,
                ), */
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: 15,
            child: FloatingActionButton(
              onPressed: () => context.read<RoutingData>().returnBack,
              backgroundColor: Colors.red,
              child: const FittedBox(
                child: Icon(
                  Icons.home,
                  size: 44,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
