
import 'package:flutter/material.dart';
import 'package:news/web-view/web_view.dart';

Widget buildArticleItem (article,context) => InkWell(
  onTap: (){
    NavigateTo(context,WebViewScreen(article['url']));
  },
  child:   Padding(

    padding: const EdgeInsets.all(20.0),

    child: Row(

      children: [

        Container(

          width: 120,

          height: 120,

          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(10),

            image: DecorationImage(

              image: NetworkImage('${article['image']}'),

              fit: BoxFit.cover,

            ),



          ),

        ),

        SizedBox(width: 20,),

        Expanded(

          child: Container(

            height: 120,

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              mainAxisAlignment: MainAxisAlignment.start,

              children: [

                Expanded(

                  child: Text('${article['title']} ',

                      style: Theme.of(context).textTheme.bodyText1,

                      maxLines: 3,

                      overflow: TextOverflow.ellipsis

                      ),

                ),

                Text('${article['publishedAt']}',style: TextStyle(

                    color: Colors.grey,

                ),

                    maxLines: 3,

                    overflow: TextOverflow.ellipsis)

              ],

            ),

          ),

        )

      ],

    ),

  ),
);

Widget myDivider () => Padding(
padding: const EdgeInsets.all(20.0),
child: Container(
height: .3,
width: double.infinity,
color: Colors.grey,
),
);

void NavigateTo(context,Widget) => Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context)=>Widget
    )
);


