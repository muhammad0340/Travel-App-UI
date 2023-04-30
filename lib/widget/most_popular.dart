import 'package:flutter/material.dart';
import 'package:flutter_travel_app_ui/detail_page.dart';
import 'package:flutter_travel_app_ui/model/travel.dart';

class MostPopular extends StatelessWidget {
  final _list = Travel.generateMostPopular();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.only(right: 15, left: 15, bottom: 15),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var travel = _list[index];
          return GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailPage(travel: travel,)));
            },
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    travel.url,
                    fit: BoxFit.cover,
                    width: 140,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: Text(
                          travel.location,
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: Text(
                          travel.location,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (_, index) => SizedBox(
              width: 15,
            ),
        itemCount: _list.length);
  }
}
