import 'package:flutter/material.dart';
import 'package:wootter_news/color.dart';

class NewsBody extends StatefulWidget {
  @override
  _NewsBodyState createState() => _NewsBodyState();
}

class _NewsBodyState extends State<NewsBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        Expanded(
          child: ListView(
            children: <Widget>[
              _cardView(),
            ],
          ),
        ),
      ],
    );
  }
}

Widget _cardView() {
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
                'Help Net Security . 10 mins',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 90),
              Row(
                children: [
                  Icon(Icons.more_horiz),
                ],
              )
            ],
          ),
          Column(
            children: [
              SizedBox(
                  height: 250,
                  child: Image(
                    image: AssetImage('assets/logos.png'),
                  )),
              Column(
                children: [
                  Text('Dummy Text that will fetch through JSON parsing'),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                       icon: Icon(Icons.share),
                        onPressed: (){
                          //TO-DO
                        },),
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
}

// Widget _upperLayer() {
//   return Container(
//     height: 40,
//     color: Colors.white,
//     child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           FlatButton(
//             onPressed: () {
//               // TODO
//             },
//             child: Text(
//               'Newest',
//               style: TextStyle(color: Colors.white),
//             ),
//             color: kPrimaryColor,
//           ),
//           FlatButton(
//             onPressed: () {
//               // TODO
//             },
//             child: Text(
//               'Major',
//               style: TextStyle(color: Colors.white),
//             ),
//             color: kPrimaryColor,
//           ),
//           FlatButton(
//             onPressed: () {
//               // TODO
//             },
//             child: Text(
//               'Discussed',
//               style: TextStyle(color: Colors.white),
//             ),
//             color: kPrimaryColor,
//           ),
//         ]),
//   );
// }
