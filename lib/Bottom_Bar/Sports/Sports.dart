import 'package:flutter/material.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Cubit/cubit.dart';
import 'package:news/Cubit/states.dart';
import 'package:news/buildItem.dart';

import '../../article_builder.dart';



class Sports extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, state) {
      },
      builder:(context, state) {

        var list = NewsCubit.get(context).sports;
        return articleBuilder (list,context);
      },

    );
  }
}
