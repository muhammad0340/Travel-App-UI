import 'package:flutter/material.dart';
import 'package:flutter_travel_app_ui/model/travel.dart';

class DetailPage extends StatelessWidget {
  final Travel travel;
  final double expendedHeight = 300;
  final double roundContainerHeight = 50;

  const DetailPage({Key? key, required this.travel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              _buildSilverHead(),
              SliverToBoxAdapter(
                child: _buildDetail(),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top, right: 15, left: 15),
            child: SizedBox(
              height: kToolbarHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      )),
                  Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSilverHead() {
    return SliverPersistentHeader(
        delegate: DetailSliverDelegate(
            travel: travel,
            expendedHeight: expendedHeight,
            roundContainerHeight: roundContainerHeight));
  }

  Widget _buildDetail() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          _buildUserInfo(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 18),
            child: Text(
              "This is the most beautifull place in the "
              "world the is lies in the north of pakistan"
              " thiis lies in the mountain range of the pakistaon many"
              "world the is lies in the north of pakistan"
              " thiis lies in the mountain range of the pakistaon many"
              "world the is lies in the north of pakistan"
              " thiis lies in the mountain range of the pakistaon many"
              " people visited every year their is a snow fall in winter"
              " their is alots of other beautiflul place in pakistan  ",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Feather",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5),
                ),
                Text(
                  "View all",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 120,child: FeaturedWidget(),),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 18),
            child: Text(
              "This is the most beautifull place in the "
                  "world the is lies in the north of pakistan"
                  " thiis lies in the mountain range of the pakistaon many"
                  "world the is lies in the north of pakistan"
                  " thiis lies in the mountain range of the pakistaon many"
                  "world the is lies in the north of pakistan"
                  " thiis lies in the mountain range of the pakistaon many"
                  " people visited every year their is a snow fall in winter"
                  " their is alots of other beautiflul place in pakistan  ",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              travel.url,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  travel.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  travel.location,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Icon(
            Icons.share,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}

class DetailSliverDelegate extends SliverPersistentHeaderDelegate {
  final Travel travel;
  final double expendedHeight;
  final double roundContainerHeight;
  DetailSliverDelegate(
      {required this.travel,
      required this.expendedHeight,
      required this.roundContainerHeight});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.8,
          child: Image.asset(
            travel.url,
            width: MediaQuery.of(context).size.width,
            height: expendedHeight,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: expendedHeight - roundContainerHeight - shrinkOffset,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: roundContainerHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
          ),
        ),
        Positioned(
          top: expendedHeight - shrinkOffset - 120,
          left: 30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                travel.name,
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              Text(
                travel.location,
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expendedHeight;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class FeaturedWidget extends StatelessWidget {
  final _list = Travel.generateMostPopular();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
          var travel = _list[index];
            return Container(
              height: 100,
              width: 120,
              child: Image.asset(travel.url,fit: BoxFit.cover,),
            );
          },
          separatorBuilder: (context,index){
          return SizedBox(width: 10,);
          },
          itemCount: _list.length,
      ),
    );
  }
}
