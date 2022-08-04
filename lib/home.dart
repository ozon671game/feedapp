import 'package:flutter/material.dart';

import 'feed.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.feedList}) : super(key: key);
  final List<SingleFeedModel> feedList;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool showSingleFeed = false;
  SingleFeedModel? _singleFeedModel;

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: showSingleFeed ? AppBar(
        backgroundColor: Color(0x44000000),
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () {
          setState(() {
            showSingleFeed = false;
          });
        },
        ),
      ) : null,
      body: showSingleFeed ? singleFeed(_singleFeedModel!) : ListView(
        physics: const ScrollPhysics(),
        children: <Widget>[
          const SizedBox(height: 50,),
          const SizedBox(
            height: 200,
            width: 200,
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/feed.jpg'),
            ),
          ),
          const SizedBox(height: 30,),
          const Center(child: Text('Ваш бухгалтер'),),
          const SizedBox(height: 10,),
          const Center(child: Text('Наталья Анашкина'),),
          const SizedBox(height: 30,),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text('Уведомления'),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                  border: Border.all(
                    color: Colors.amber,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(20))
              ),
              height: 100,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Image.asset('assets/roup.png'),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text('Новости'),
          ),
          ListView.builder(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.feedList.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(15.0),
                child: InkWell(
                  onTap: () {
                    _singleFeedModel = widget.feedList[index];
                    setState(() {
                      showSingleFeed = true;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/feed.jpg')),
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.amber,
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(20))
                    ),
                    height: 220,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(widget.feedList[index].title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),textAlign: TextAlign.start,),
                      ),
                    ),
                  ),
                ),
              ),
          ),
        ],
      ),
    );
  }

  Widget singleFeed(singleFeed) {
    return ListView(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/feed.jpg',), fit: BoxFit.fill),
            color: Colors.white,
          ),
          height: 300,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(singleFeed.title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white), textAlign: TextAlign.start,),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: Text('25 мая 2021 14:15'),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(singleFeed.body),
        ),
        const SizedBox(height: 50,),
      ],
    );
  }
}
