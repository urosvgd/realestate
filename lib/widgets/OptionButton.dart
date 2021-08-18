import 'package:flutter/material.dart';
import 'package:realestate/utils/constants.dart';
import 'package:realestate/utils/widget_function.dart';

class OptionButton extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final width;

  const OptionButton({Key? key, this.text, this.width, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      width: width,
      child: FlatButton(
        onPressed: () {},
        color: COLOR_DARK_BLUE,
        splashColor: COLOR_WHITE.withAlpha(55),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          children: [
            Icon(icon, color: COLOR_WHITE),
            addHorizontalSpace(10),
            Text(text!, style: TextStyle(color: COLOR_WHITE))
          ],
        ),
      ),
    );
  }
}
