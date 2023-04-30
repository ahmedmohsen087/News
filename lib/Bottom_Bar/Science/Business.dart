import 'package:flutter/material.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Cubit/cubit.dart';
import 'package:news/Cubit/states.dart';
import 'package:news/buildItem.dart';

class Business extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, state) {
      },
      builder:(context, state) {

        var list = NewsCubit.get(context).business;
        return ConditionalBuilder(
          condition: state is! NewsGetBusinessLoadingStates ,
          builder:(context) => ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder:(context, index) => buildArticleItem(list[index]),
            separatorBuilder: (context, index) => myDivider() ,
            itemCount: list.length,
          ) ,
          fallback: (context) =>Center(child: CircularProgressIndicator()) ,
        );
      },

    );
  }
}
