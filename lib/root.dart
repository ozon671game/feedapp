import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';

import 'feed.dart';
import 'home.dart';
import 'loading_widget.dart';

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  List<SingleFeedModel> feedList = [];

  getData() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    Response response = await get(url);

    if (response.statusCode == 200) {
      List jsonData = jsonDecode(response.body);
      for (var e in jsonData) {
        feedList.add(SingleFeedModel(
            title: e['title'] ?? '',
            body: e['body'] ?? ''));
      }
      setState(() {});
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return feedList.isEmpty ? const LoadingWidget() : DefaultTabController(
      initialIndex: 0,
      length: 5,
      child: Scaffold(
        body: Container(
          color: Colors.grey,
          child: TabBarView(
            children: <Widget>[
              Home(feedList: feedList,),
              placeholder('Мои кампании'),
              placeholder('Мои кампании'),
              placeholder('Календарь'),
              placeholder('Профиль'),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: TabBar(
            indicatorColor: Colors.transparent,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.home_outlined, color: Colors.black,),
              ),
              Tab(
                icon: Icon(Icons.markunread_mailbox_outlined, color: Colors.black,),
              ),
              Tab(
                icon: Icon(Icons.cloud_outlined, color: Colors.black,),
              ),
              Tab(
                icon: Icon(Icons.calendar_month_outlined, color: Colors.black,),
              ),
              Tab(
                icon: Icon(Icons.person_outline_rounded, color: Colors.black,),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget placeholder(String title) {
    return Container(
      color: Colors.grey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text('Функциона раздела "$title" находится в разработке', textAlign: TextAlign.start, style: TextStyle(fontSize: 18),),
          ),
          SvgPicture.asset('assets/placeholder.svg'),
        ],
      ),
    );
  }
}
