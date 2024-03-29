import 'package:afisha_web/const/const_variables.dart';
//import 'package:afisha_web/routing_data.dart';
import 'package:afisha_web/widgets/library_logo.dart';
import 'package:afisha_web/widgets/menu_button.dart';
import 'package:flutter/widgets.dart';

import 'package:afisha_web/theme/screen.dart';
// ignore: implementation_imports
//import 'package:provider/src/provider.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

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
          Positioned(
            top: Screen.width(context) * 0.2 + 150,
            left: (Screen.width(context) - Screen.width(context) * 0.6) / 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                /* Афиша */
                MenuButton(
                    context: context,
                    nameButton: GlobalVar.billboard,
                    route: GlobalVar.routeAfisha),
                const SizedBox(
                  height: 20,
                ),

                /* Структура */
                MenuButton(
                    context: context,
                    nameButton: GlobalVar.structure,
                    route: GlobalVar.routeLibiraryStructure),
                const SizedBox(
                  height: 20,
                ),

                /* Библиотека в Сети */
                MenuButton(
                  context: context,
                  nameButton: GlobalVar.libInNetwork,
                  route: GlobalVar.routeLibInNetwork,
                ),
                const SizedBox(
                  height: 20,
                ),
                /* Правила Читателей*/
                MenuButton(
                    context: context,
                    nameButton: GlobalVar.rules4Readers,
                    route: GlobalVar.routeRules4Readers),
                const SizedBox(
                  height: 20,
                ),

                /* Книжная коллекция */
                /*
                MenuButton(
                  context: context,
                  nameButton: GlobalVar.booksCoolection,
                  route: GlobalVar.routeBookCollectionMenu,
                ),
                const SizedBox(
                  height: 20,
                ),
                */
              ],
            ),
          ),
        ],
      ),
    );
  }
}
