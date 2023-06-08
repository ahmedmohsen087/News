import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import 'buildItem.dart';

Widget articleBuilder (list,context) => ConditionalBuilder(
  condition:  list.length>0,
  builder:(context) => ListView.separated(
    physics: BouncingScrollPhysics(),
    itemBuilder:(context, index) => buildArticleItem(list[index],context),
    separatorBuilder: (context, index) => myDivider() ,
    itemCount: list.length,
  ) ,
  fallback: (context) =>Center(child: CircularProgressIndicator()) ,
);