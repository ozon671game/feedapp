import 'package:flutter/material.dart';

class SingleFeed extends StatefulWidget {
  const SingleFeed({Key? key, required this.singleFeed}) : super(key: key);
  final SingleFeedModel singleFeed;

  @override
  State<SingleFeed> createState() => _SingleFeedState();
}

class _SingleFeedState extends State<SingleFeed> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
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
                child: Text(widget.singleFeed.title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(widget.singleFeed.body),
          ),
          const SizedBox(height: 50,),
        ],
      ),
    );
  }
}

class SingleFeedModel {
  SingleFeedModel({
    required this.title,
    required this.body,
  });

  final String title, body;
}
