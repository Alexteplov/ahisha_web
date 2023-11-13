import 'package:afisha_web/const/const_variables.dart';
import 'package:afisha_web/routing_data.dart';
//import 'package:afisha_web/widgets/html_content.dart';
//import 'package:afisha_web/widgets/web_view_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:fwfh_webview/fwfh_webview.dart';

// ignore: implementation_imports
import 'package:provider/src/provider.dart';

class ScreenHtml extends StatelessWidget {
  final String urlSrc;
  final String uIdent;
  const ScreenHtml({Key? key, required this.urlSrc, required this.uIdent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<RoutingData>().setRouteNextSteep(GlobalVar.routeEmpty);
    return WillPopScope(
      onWillPop: () async {
        context.read<RoutingData>().returnBack;
        //setRoute(GlobalVar.routeMainMenu);
        return true;
      },
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: HtmlWidget(
                '<iframe src="$urlSrc" allow="cross-origin-isolated"></iframe>',
                factoryBuilder: () => MyWidgetFactory(),
              ),
              /* HtmlContent(
                srcUrl: urlSrc,
                uIdent: uIdent,
              ), */
            ),
            Expanded(
              flex: 1,
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
      ),
    );
  }
}

class MyWidgetFactory extends WidgetFactory with WebViewFactory {
  bool get webViewMediaPlaybackAlwaysAllow => true;
  String? get webViewUserAgent => 'My app';
}
