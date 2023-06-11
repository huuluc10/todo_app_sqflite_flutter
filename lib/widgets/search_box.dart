// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import '../utils/colors.dart';

Container SearchBox(dynamic runFilter) {
  return Container(
    margin: const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 7,
    ),
    padding: const EdgeInsets.symmetric(horizontal: 15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(32),
      color: Colors.white,
    ),
    child: TextField(
      onChanged: (value) => runFilter(value),
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.all(0),
        prefixIcon: Icon(Icons.search),
        prefixIconConstraints: BoxConstraints(
          maxHeight: 20,
          minWidth: 25,
        ),
        border: InputBorder.none,
        hintText: 'Search',
        hintStyle: TextStyle(color: greyCustom),
      ),
    ),
  );
}
