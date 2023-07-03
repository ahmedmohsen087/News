import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/article_builder.dart';

import '../Cubit/cubit.dart';
import '../Cubit/states.dart';

var SearchController = TextEditingController();

class SearchScreen extends StatelessWidget {
  static const String routeName = 'SearchScreen' ;
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, state) {
      },
      builder: (context, state) {
        var list = NewsCubit.get(context).Search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyText1,
                  onChanged: (value)
                  {
                    NewsCubit.get(context).getSearch(value);
                  },
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2)
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(0.0),
                        child: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ), // icon is 48px widget.
                      ),
                      hintText: 'Search'
                  ),
                  controller: SearchController,
                  keyboardType: TextInputType.text,
                  validator: ( value) {
                    if(value!.isEmpty){
                      return 'search must be not empty';
                    }
                    return null ;
                  },


                ),

              ),
              Expanded(child: articleBuilder(list, context))
            ],
          ),

        );
      },
    );
  }
}
