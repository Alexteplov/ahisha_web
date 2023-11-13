import 'package:afisha_web/routing_data.dart';
import 'package:flutter/material.dart';
import 'package:afisha_web/theme/screen.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

// ignore: must_be_immutable
class MenuButton extends StatelessWidget {
  MenuButton(
      {Key? key,
      required this.context,
      required this.nameButton,
      this.route = '',
      this.logo = '',
      this.buttonHeight = 0.07,
      this.buttonWidth = 0.6})
      : super(key: key);

  final BuildContext context;
  final String nameButton;
  String route;
  String logo;
  double buttonHeight;
  double buttonWidth;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          fixedSize: Size(Screen.width(context) * buttonWidth,
              Screen.height(context) * buttonHeight),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      onPressed: () {
        if (route.isNotEmpty) {
          context.read<RoutingData>().setRoute(route);
          //Navigator.pushNamed(context, route);
          //print('route ${route}');
        }
      },
      child: logo.isNotEmpty
          ? Row(
              children: [
                Image.asset(
                  logo,
                  width: Screen.height(context) * 0.05,
                  height: Screen.height(context) * 0.05,
                ),
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      nameButton,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            )
          : FittedBox(
              fit: BoxFit.contain,
              child: Text(
                nameButton,
                textAlign: TextAlign.left,
              ),
            ),
    );
  }
}
