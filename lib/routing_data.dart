//import 'dart:math';

/* import 'package:afisha_web/afisha/afisha001.dart';
import 'package:afisha_web/afisha/afisha002.dart';
import 'package:afisha_web/afisha/afisha003.dart';
import 'package:afisha_web/afisha/afisha003a.dart';
import 'package:afisha_web/afisha/afisha_w01.dart';
import 'package:afisha_web/afisha/afisha_w01a.dart';
import 'package:afisha_web/afisha/afisha_w02.dart';
import 'package:afisha_web/afisha/afisha_w02a.dart'; */
import 'package:url_launcher/url_launcher.dart';
import 'package:afisha_web/screens/library_in_network/library_in_network.dart';
import 'package:afisha_web/screens/rules_for_readers/rules_for_readers.dart';
import 'package:afisha_web/widgets/lower_navigation.dart';
import 'package:afisha_web/widgets/main_menu.dart';
import 'package:afisha_web/widgets/page_struct.dart';
import 'package:afisha_web/widgets/page_view.dart';
import 'package:afisha_web/widgets/screen_html.dart';
import 'package:flutter/cupertino.dart';

import '../const/const_variables.dart';

class RoutingData with ChangeNotifier {
  //String _route = GlobalVar.routeMainMenu;
  final _stackW = [];
  late final BuildContext _context;
  DateTime eventDt = DateTime.now();
  String _nextSteep = GlobalVar.routeEmpty;

//  Widget get getWidget => const MainMenu();

  RoutingData(this._context);

  Widget get getWidget {
    return _stackW.isNotEmpty ? _stackW.last : const MainMenu();

    //return const MainMenu();
  }

  Widget get getLowerNavigation => LowerNavigation(context: _context);

  DateTime get getEventDt => eventDt;

  void goMainMenu() {
    _nextSteep = GlobalVar.routeEmpty;
    _stackW.clear();
    //setStack(GlobalVar.routeMainMenu);
    eventDt = DateTime.now();
    notifyListeners();
  }

  void setRoute(String route) {
    if (route.isNotEmpty) {
      setStack(route);
    } else {
      setStack(GlobalVar.routeMainMenu);
    }
    eventDt = DateTime.now();
    notifyListeners();
  }

  void setRouteNextSteep(String route) {
    if (route.isNotEmpty) {
      _nextSteep = route;
      //print('set route = $route');
    } else {
      _nextSteep = GlobalVar.routeEmpty;
    }
    //eventDt = DateTime.now();
  }

/*   String get getBgAfisha {
    return 'image/bgAfisha/0${Random().nextInt(9)}.jpg';
  } */

  String get getNextSteep => _nextSteep;

  Widget get returnBack {
    _stackW.removeLast();
    if (_stackW.isEmpty) {
      _nextSteep = GlobalVar.routeEmpty;
    }
    eventDt = DateTime.now();
    notifyListeners();
    return _stackW.isNotEmpty ? _stackW.last : const MainMenu();
  }

  bool isReturnActive() {
    return _stackW.isNotEmpty;
  }

  void setStack(String route) {
    if (route == GlobalVar.routeAfisha) {
      _stackW.add(PageViewAfisha());
      //rules for readers
    } else if (route == GlobalVar.routeRules4Readers) {
      _stackW.add(const RulesForReaders());
    } else if (route == GlobalVar.routeRulesForReadersHtml) {
      _stackW.add(const ScreenHtml(
        urlSrc: GlobalVar.urlRules,
        uIdent: GlobalVar.routeRules4Readers,
      ));
    } else if (route == GlobalVar.routeLibRules) {
      _stackW.add(const ScreenHtml(
        urlSrc: GlobalVar.urlRules,
        uIdent: GlobalVar.routeLibRules,
      ));
      //_launchUrl(Uri.parse(GlobalVar.urlRules));
    } else if (route == GlobalVar.routeLib) {
      _stackW.add(const ScreenHtml(
        urlSrc: GlobalVar.urlDB,
        uIdent: GlobalVar.routeLib,
      ));
      //_launchUrl(Uri.parse(GlobalVar.urlDB));
    } else if (route == GlobalVar.routeInContact) {
      /*
      _stackW.add(const ScreenHtml(
        urlSrc: GlobalVar.urlVK,
        uIdent: GlobalVar.routeInContact,
      ));
*/
      _launchUrl(Uri.parse(GlobalVar.urlVK));
    } else if (route == GlobalVar.routeOdnoklassniki) {
      /*_stackW.add(const ScreenHtml(
        urlSrc: GlobalVar.urlOdn,
        uIdent: GlobalVar.routeOdnoklassniki,
      ));
      */
      _launchUrl(Uri.parse(GlobalVar.urlOdn));
    } else if (route == GlobalVar.routeLibiraryStructure) {
      _stackW.add(PageStruct());
    } else if (route == GlobalVar.routeLibInNetwork) {
      _stackW.add(const LibraryInNetwork());
      /*
    } else if (route == GlobalVar.routeLibiraryStructure) {
      _stackW.add(const LibraryStructure());
    } else if (route == GlobalVar.routeLibiraryStructureA) {
      _stackW.add(const LibraryStructureA());
    } else if (route == GlobalVar.routeLibiraryStructureB) {
      _stackW.add(const LibraryStructureB());
    } else if (route == GlobalVar.routeLibInNetwork) {
      _stackW.add(const LibraryInNetwork());
    } 
    */
    } else {
      _stackW.add(const MainMenu());
      _nextSteep = GlobalVar.routeEmpty;
    }
  }

  void setContext(BuildContext context) {
    _context = context;
  }

  Future<void> _launchUrl(url) async {
    if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
      throw Exception('Could not launch $url');
    }
  }
}
