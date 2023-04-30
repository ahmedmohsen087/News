import 'package:flutter/material.dart';

Widget buildArticleItem (article) => Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage('${article['urlToImage']}'),
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
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600
                    ),maxLines: 4,
                    overflow: TextOverflow.ellipsis),
              ),
              Text('${article['publishedAt']}',style: TextStyle(
                  color: Colors.grey
              ),)
            ],
          ),
        ),
      )
    ],
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