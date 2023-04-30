import 'package:flutter/material.dart';
import 'package:flutter_travel_app_ui/widget/most_popular.dart';
import 'package:flutter_travel_app_ui/widget/travel_blog.dart';

import 'model/travel.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(Icons.menu,color: Colors.black,),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Text("Travel Blog",style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold),),
          ),
          Expanded(
              flex: 2,
              child: TravelBlog()),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Most Popular",style: TextStyle(fontSize: 20),),
                Text("View More",style: TextStyle(fontSize: 16,color: Colors.orange),),
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: MostPopular()),
        ],
      )
    );
  }
}
