// не испльзуется в перспективе удалить.
import 'dart:ui';

import 'package:afisha_web/const/const_variables.dart';
import 'package:afisha_web/widgets/struct_custom_clipper.dart';
import 'package:flutter/material.dart';
import 'package:afisha_web/theme/screen.dart';
import 'package:google_fonts/google_fonts.dart';

class StructureContent extends StatefulWidget {
  StructureContent({
    Key? key,
    required this.borderSq,
    required this.img,
    required this.borderType,
    required this.eventHead,
    required this.event,
  }) : super(key: key);

  final Color borderSq;
  final String img;
  final String borderType;
  final String eventHead;
  final String event;
  @override
  _StructureContentState createState() =>
      _StructureContentState(borderSq, img, borderType, eventHead, event);
}

class _StructureContentState extends State<StructureContent> {
  final Color _borderSq;
  final String _img;
  final String _borderType;
  final String _eventHead;
  final String _event;
  bool _showPreview = false;
  String _image = GlobalVar.bgImgAfishaWeekendsW;

  _StructureContentState(this._borderSq, this._img, this._borderType,
      this._eventHead, this._event);

  @override
  Widget build(BuildContext context) {
    double rectangleSide = Screen.width(context) * 0.1852;
    double widthContText = Screen.width(context) -
        (Screen.width(context) * 0.09 + rectangleSide + 15);
    //print(widthContText);
    return Stack(
      alignment: AlignmentDirectional.topStart,
      textDirection: TextDirection.ltr,
      fit: StackFit.loose,
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
        Column(
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 50,
                ),
                Container(
                  width: Screen.width(context) * 0.7,
                  height: Screen.height(context) * 0.16,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(GlobalVar.logoImg),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 20,
                ),
                Stack(
                  children: [
                    ClipPath(
                      clipper: StructCustomClipper(), // <--
                      child: Container(
                        width: rectangleSide,
                        height: rectangleSide,
                        color: _borderSq, //StructureData.colorRed,
                      ),
                    ),
                    Positioned(
                      top: rectangleSide * 0.025,
                      left: rectangleSide * 0.025,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _showPreview = !_showPreview;
                            _image = _img;
                            //print(_showPreview);
                          });
                        },
                        child: Container(
                          width: rectangleSide - (rectangleSide * 0.05),
                          height: rectangleSide - (rectangleSide * 0.05),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage(_img), fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  textDirection: TextDirection.ltr,
                  alignment: AlignmentDirectional.topStart,
                  children: [
                    Positioned(
                      top: 12,
                      left: 15,
                      child: Image.asset(
                        _borderType,
                        width: _eventHead.length * 7.2 > widthContText
                            ? widthContText
                            : _eventHead.length * 7.2,
                        height:
                            _eventHead.length * 6.7 > widthContText ? 60 : 35,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 8),
                      child: SizedBox(
                          width: widthContText,
                          height: Screen.height(context) * 0.5,
                          //fit: BoxFit.contain,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _eventHead,
                                style: GoogleFonts.oswald(
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(fontWeight: FontWeight.bold)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: Text(
                                  textAlign: TextAlign.justify,
                                  _event,
                                  style: GoogleFonts.oswald(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .subtitle2!),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        if (_showPreview) ...[
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5.0,
              sigmaY: 5.0,
            ),
            child: Container(
              color: Colors.white.withOpacity(0.6),
            ),
          ),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _showPreview = !_showPreview;
                  });
                },
                child: Image.asset(
                  _image,
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
