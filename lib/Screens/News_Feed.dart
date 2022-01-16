import 'package:flutter/material.dart';
import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:wootter_news/Screens/webview_screen.dart';
import 'package:wootter_news/color.dart';

class RSSDemo extends StatefulWidget {
  RSSDemo() : super();

  final String title = 'Wotter News';

  @override
  RSSDemoState createState() => RSSDemoState();
}

class RSSDemoState extends State<RSSDemo> {
  static const String FEED_URL = 'https://portswigger.net/daily-swig/rss';
  RssFeed _feed;
  String _title;
  static const String loadingFeedMsg = 'Loading Feed...';
  static const String feedLoadErrorMsg = 'Error Loading Feed.';
  static const String feedOpenErrorMsg = 'Error Opening Feed.';
  static const String placeholderImg = 'assets/';
  GlobalKey<RefreshIndicatorState> _refreshKey;

  updateTitle(title) {
    setState(() {
      _title = title;
    });
  }

  updateFeed(feed) {
    setState(() {
      _feed = feed;
    });
  }

  Future<void> openFeed(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
      );
      return;
    }
    updateTitle(feedOpenErrorMsg);
  }

  load() async {
    updateTitle(loadingFeedMsg);
    loadFeed().then((result) {
      if (null == result || result.toString().isEmpty) {
        updateTitle(feedLoadErrorMsg);
        return;
      }
      updateFeed(result);
      updateTitle('Wootter News');
    }).catchError((onError) => {print(onError)});
  }

  Future<RssFeed> loadFeed() async {
    try {
      final client = http.Client();
      final response = await client.get(FEED_URL);
      return RssFeed.parse(response.body);
    } catch (e) {
      print(e);
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    _refreshKey = GlobalKey<RefreshIndicatorState>();
    updateTitle(widget.title);
    load();
  }

  title(title) {
    return Text(
      title,
      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  subtitle(subTitle) {
    return Text(
      subTitle,
      style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w100),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  thumbnail(imageUrl) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0),
      child: CachedNetworkImage(
        placeholder: (context, url) => Image.asset(placeholderImg),
        imageUrl: imageUrl,
        height: 50,
        width: 70,
        alignment: Alignment.center,
        fit: BoxFit.fill,
      ),
    );
  }

  rightIcon() {
    return Icon(
      Icons.keyboard_arrow_right,
      color: Colors.grey,
      size: 30.0,
    );
  }

  list() {
    return ListView.builder(
      itemCount: _feed.items.length,
      itemBuilder: (BuildContext context, int index) {
        final item = _feed.items[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Card(
                // color: Colors.grey,
                child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.add),
                    Text(
                      'Help Net Security',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 90),
                    Row(
                      children: [
                        // Icon(Icons.more_horiz),
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WebViewScreen(item.link)));
                      },
                      // onTap: () => openFeed(item.link),
                      child: Image.network(
                        item.media.thumbnails[0].url,
                        height: 250,
                        // fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          item.title,
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w500),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 10),
                        Text(
                          item.description,
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.w100),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: Icon(Icons.share),
                              onPressed: () {
                                //TO-DO
                              },
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                )
              ],
            )),
          ),
        );
        // return ListTile(
        //   title: title(item.title),
        //   // subtitle: subtitle(item.pubDate),
        //   subtitle: subtitle(item.description),
        //   leading: thumbnail(item.media.thumbnails[0].url),
        //   trailing: rightIcon(),
        //   contentPadding: EdgeInsets.all(5.0),
        //   onTap: () => openFeed(item.link),
        // );
      },
    );
  }

  isFeedEmpty() {
    return null == _feed || null == _feed.items;
  }

  body() {
    return isFeedEmpty()
        ? Center(
            child: CircularProgressIndicator(),
          )
        : RefreshIndicator(
            key: _refreshKey,
            child: list(),
            onRefresh: () => load(),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
         title: new Center(child: new Text(_title, textAlign: TextAlign.center)),
        leading: Builder(
    builder: (BuildContext context) {
      return Icon(Icons.donut_large, color: kPrimaryColor);
    },
  ),
      ),
      body: body(),
    );
  }
}
