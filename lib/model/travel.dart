class Travel{
  String name;
  String location;
  String url;
  Travel({required this.name,required this.location,required this.url});

  static List<Travel> generateTravelBlog(){
    return [
      Travel(name: "place 1", location: "place1", url: "images/pic1.jpg"),
      Travel(name: "place 2", location: "place2", url: "images/pic2.jpg"),
      Travel(name: "place 3", location: "place3", url: "images/pic3.jpg"),
      Travel(name: "place 4", location: "place4", url: "images/pic4.jpg"),
    ];
  }
  static List<Travel> generateMostPopular(){
    return [
      Travel(name: "place 5", location: "place 5", url: "images/pic5.jpg"),
      Travel(name: "place 6", location: "place 6", url: "images/pic8.jpg"),
      Travel(name: "place 7", location: "place 7", url: "images/pic7.jpg"),
      Travel(name: "place 8", location: "place 8", url: "images/pic10.jpg"),
    ];
  }
}