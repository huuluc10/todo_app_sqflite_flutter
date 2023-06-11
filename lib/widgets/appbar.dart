import 'package:flutter/material.dart';

import '../utils/colors.dart';

AppBar AppBarCustom() {
  return AppBar(
    leading: const Icon(Icons.menu),
    backgroundColor: backgroudColor,
    elevation: 0,
    actions: [
      Container(
        margin: const EdgeInsets.only(right: 14),
        child: const CircleAvatar(
          backgroundImage: AssetImage('assets/cir.jpg'),
        ),
      ),
    ],
  );
}
