import 'package:flutter/material.dart';

Widget titleWidget(BuildContext context, String title) =>
    Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.brightness_1,
                  size: 15,
                  color: Theme
                      .of(context)
                      .primaryColor,
                ),
                SizedBox(width: 5),
                Text(title,
                    style:
                    TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
              ],
            ),
            Divider(thickness: 2)
          ],
        ),
      ),
    );
