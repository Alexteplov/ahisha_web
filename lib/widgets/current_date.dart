import 'package:afisha_web/routing_data.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:provider/provider.dart';

import '../../../const/const_variables.dart';

class CurrentDate extends StatefulWidget {
  const CurrentDate({Key? key, required BuildContext context})
      : super(key: key);

  @override
  _CurrentDateState createState() => _CurrentDateState();
}

class _CurrentDateState extends State<CurrentDate> {
  late String _currentTime;
  late String _currentDate;
  late DateTime dt;

  @override
  void initState() {
    _currentTime =
        "${DateTime.now().hour.toString().padLeft(2, '0')}:${DateTime.now().minute.toString().padLeft(2, '0')}:${DateTime.now().second.toString().padLeft(2, '0')}";
    _currentDate =
        "${DateTime.now().day.toString().padLeft(2, '0')}.${DateTime.now().month.toString().padLeft(2, '0')}.${DateTime.now().year}";
    Timer.periodic(
        const Duration(seconds: 1), (Timer t) => _getCurrentTime(context));
    super.initState();
  }

  void _getCurrentTime(BuildContext context) async {
    setState(() {
      _currentTime =
          "${DateTime.now().hour.toString().padLeft(2, '0')}:${DateTime.now().minute.toString().padLeft(2, '0')}:${DateTime.now().second.toString().padLeft(2, '0')}";
      _currentDate =
          "${DateTime.now().day.toString().padLeft(2, '0')}.${DateTime.now().month.toString().padLeft(2, '0')}.${DateTime.now().year}";
    });

    dt = context
        .read<RoutingData>()
        .eventDt
        .add(Duration(seconds: MainSettings.duration2MainMenu));

    if (dt.compareTo(DateTime.now()) <= 0) {
      context.read<RoutingData>().goMainMenu();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
        fit: BoxFit.fitHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(_currentTime,
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontWeight: FontWeight.bold)),
            Text(_currentDate, style: Theme.of(context).textTheme.headline5),
          ],
        ));
  }
}
