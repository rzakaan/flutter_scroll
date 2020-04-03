import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutterscroll/data/profiledata.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final List<ProfileData> profiles = [
    ProfileData(
        userName: "Rıza Kaan",
        userImage:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f5/Poster-sized_portrait_of_Barack_Obama.jpg/1200px-Poster-sized_portrait_of_Barack_Obama.jpg",
        description: "description"),

    ProfileData(
        userName: "Yvonne Strahovski",
        userImage:
        "https://i.pinimg.com/originals/29/27/69/292769eb55318a7fc63659d16065bf4a.jpg",
        description: "description")
  ];

  final List<String> stories = [
    "https://i.pinimg.com/originals/29/27/69/292769eb55318a7fc63659d16065bf4a.jpg",
    "https://i.pinimg.com/originals/13/8b/4c/138b4c834be6af10cae455976575b50d.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f5/Poster-sized_portrait_of_Barack_Obama.jpg/1200px-Poster-sized_portrait_of_Barack_Obama.jpg",
    "https://www.croatiaweek.com/wp-content/uploads/2013/07/Hugh-Laurie-1.jpg",
    "https://cdn.profoto.com/cdn/0521660/contentassets/b61cf60b567f46ac9a274c3f87a5bcb1/portrait_technique_0014.jpg?width=1280&quality=75&format=jpg",
    "https://lh3.googleusercontent.com/proxy/9LiZQcNMBFUcd0mgSbIFqQ6qzeUGNZGb8YLY7ugcWjMOpKeVpEBEsZ7XSNQnYrBAxy2kIM2Rmk2wzrM7G-0ulARYNKC78lv3ZxWIozTI"
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Divider(),

            // STORIES HEADER
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Stories",
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    "Watch All",
                    style: TextStyle(fontSize: 14),
                  )
                ],
              ),
            ),

            // horizontal scroll list
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: stories.map((image) {
                  return Image(
                      image: NetworkImage(image),
                      width: 200,
                      height: 200,
                      fit: BoxFit.fill);
                }).toList(),
              ),
            ),

            // horizontal story view
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: stories.map((image) {
                  return Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(70),
                            border: Border.all(
                              width: 3,
                              color: Color(0xFF8E44AD),
                            )),
                        child: Container(
                          padding: EdgeInsets.all(2),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(70),
                            child: Image(
                                image: NetworkImage(image),
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text("Aleyna"),
                    ],
                  );
                }).toList(),
              ),
            ),

            // post view
            Container(
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: profiles.length,
                itemBuilder: (ctx, i) {
                  return Container(
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(40),
                                    child: Image(
                                        image:
                                            NetworkImage(profiles[i].userImage),
                                        width: 40,
                                        height: 40,
                                        fit: BoxFit.cover),
                                  ),
                                  SizedBox(width: 15),
                                  Text(profiles[i].userName)
                                ],
                              ),
                              IconButton(
                                color: Colors.black,
                                icon: Icon(SimpleLineIcons.options),
                                onPressed: () {},
                              )
                            ],
                          ),
                        ),
                        Image(
                          image: NetworkImage(profiles[i].userImage),
                          width: MediaQuery.of(context).size.width,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(children: <Widget>[
                              IconButton(
                                icon: Icon(FontAwesome.heart_o),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(FontAwesome.comment_o),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(FontAwesome.send_o),
                                onPressed: () {},
                              )
                            ],),
                            IconButton(
                              icon: Icon(FontAwesome.bookmark_o),
                              onPressed: () {},
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
