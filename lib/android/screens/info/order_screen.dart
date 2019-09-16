// import 'package:flutter/material.dart';
// import '../../logic/data/order.dart';

// /*
// * InfoScreen is the page that is supposed to come up when a user taps on an OrderCard.
// * Visualizes the Order class.
// DEPRECATED
// */

// class InfoScreen extends StatefulWidget {
//   final Order order;

//   InfoScreen({this.order});

//   @override
//   _InfoScreenState createState() => _InfoScreenState(
//         order: order,
//       );
// }

// class _InfoScreenState extends State<InfoScreen> {
//   final Order order;

//   _InfoScreenState({this.order});

//   Icon watchlistIcon = Icon(Icons.remove_red_eye);
//   bool onWatchList = false;

//   @override
//   Widget build(BuildContext context) {
//     double _screenWidth = MediaQuery.of(context).size.width;
//     const double _margin = 16.0;
//     double _containerWidth = _screenWidth - (_margin * 2);

//     RoundedRectangleBorder appBarBorder = new RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//             bottomLeft: Radius.circular(8.0),
//             bottomRight: Radius.circular(8.0)));

//     return Container(
//       color: Theme.of(context).backgroundColor,
//       width: double.infinity,
//       height: double.infinity,
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         appBar: PreferredSize(
//           preferredSize: Size(double.infinity, 56.0),
//           child: AppBar(
//             centerTitle: true,
//             title: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Text(
//                   "1.6M\$ APPL Trade",
//                   style: Theme.of(context).textTheme.title,
//                 ),
//                 IconButton(
//                   color: Theme.of(context).primaryColor,
//                   icon: Icon(Icons.edit),
//                   onPressed: () {
//                     print("todo: change name");
//                   },
//                 )
//               ],
//             ),
//             backgroundColor: Theme.of(context).canvasColor,
//             shape: appBarBorder,
//             leading: IconButton(
//                 iconSize: 24.0,
//                 icon: Icon(Icons.arrow_back),
//                 color: Theme.of(context).primaryColor,
//                 onPressed: () {
//                   print(Navigator.of(context).toString());
//                   Navigator.of(context).pop();
//                 }),
//             actions: <Widget>[
//               IconButton(
//                 icon: watchlistIcon,
//                 color: Theme.of(context).primaryColor,
//                 onPressed: () {
//                   if (onWatchList == false) {
//                     setState(() {
//                       onWatchList = true;
//                       watchlistIcon = Icon(Icons.remove_shopping_cart);
//                     });
//                   } else {
//                     setState(() {
//                       onWatchList = false;
//                       watchlistIcon = Icon(Icons.remove_red_eye);
//                     });
//                   }
//                 },
//               )
//             ],
//           ),
//         ),
//         body: ScrollConfiguration(
//           behavior: ScrollBehavior(),
//           child: GlowingOverscrollIndicator(
//             axisDirection: AxisDirection.down,
//             color: Theme.of(context).primaryColor,
//             child: ListView(
//               children: <Widget>[
//                 Padding(
//                   padding: EdgeInsets.all(16.0),
//                   child: Material(
//                     borderRadius: BorderRadius.all(const Radius.circular(8.0)),
//                     elevation: 5.0,
//                     child: Container(
//                       decoration: BoxDecoration(
//                           color: Theme.of(context).canvasColor,
//                           borderRadius:
//                               BorderRadius.all(const Radius.circular(8.0))),
//                       child: Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Padding(
//                               padding: const EdgeInsets.only(bottom: 8.0),
//                               child: Text(
//                                 "By the numbers",
//                                 style: Theme.of(context).textTheme.title,
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(bottom: 8.0),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceEvenly,
//                                 children: <Widget>[
//                                   Container(
//                                     //color: Colors.red,
//                                     width: (_screenWidth - 64) / 2,
//                                     child: Row(
//                                       children: <Widget>[
//                                         Text(
//                                           "Time: ",
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .display4,
//                                         ),
//                                         Text(
//                                           "11:51:30",
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .display4,
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                   Container(
//                                     //color: Colors.green,
//                                     width: (_screenWidth - 64) / 2,
//                                     child: Row(
//                                       children: <Widget>[
//                                         Text(
//                                           "Data: ",
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .display4,
//                                         ),
//                                         Text(
//                                           "8/19/2019",
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .display4,
//                                         ),
//                                       ],
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(bottom: 8.0),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceEvenly,
//                                 children: <Widget>[
//                                   Container(
//                                     //color: Colors.red,
//                                     width: (_screenWidth - 64) / 2,
//                                     child: Row(
//                                       children: <Widget>[
//                                         Text(
//                                           "Price: ",
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .display4,
//                                         ),
//                                         Text(
//                                           "186.5",
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .display4,
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                   Container(
//                                     //color: Colors.green,
//                                     width: (_screenWidth - 64) / 2,
//                                     child: Row(
//                                       children: <Widget>[
//                                         Text(
//                                           "Volume: ",
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .display4,
//                                         ),
//                                         Text(
//                                           "10000",
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .display4,
//                                         ),
//                                       ],
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: <Widget>[
//                                 Container(
//                                   //color: Colors.red,
//                                   width: (_screenWidth - 64) / 2,
//                                   child: Row(
//                                     children: <Widget>[
//                                       Text(
//                                         "Total cost: ",
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .display4,
//                                       ),
//                                       Text(
//                                         "1600000\$",
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .display4,
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                                 Container(
//                                   //color: Colors.green,
//                                   width: (_screenWidth - 64) / 2,
//                                   child: Row(
//                                     children: <Widget>[
//                                       Text(
//                                         "Venue: ",
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .display4,
//                                       ),
//                                       Text(
//                                         "CBOE EDGX",
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .display4,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     print("todo: open stock dash");
//                   },
//                    child: Padding(
//                     padding: const EdgeInsets.only(left: 16.0, right: 16.0),
//                     child: Material(
//                       borderRadius: BorderRadius.all(const Radius.circular(8.0)),
//                       elevation: 5.0,
//                       child: Container(
//                         decoration: BoxDecoration(
//                             color: Theme.of(context).canvasColor,
//                             borderRadius:
//                                 BorderRadius.all(const Radius.circular(8.0))),
//                         child: Padding(
//                           padding: const EdgeInsets.all(16.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[
//                                     Text(
//                                       "APPL recent stock price",
//                                       style: Theme.of(context).textTheme.title,
//                                     ),
//                                     //todo: put a graph here of historical stock price
//                                     Padding(
//                                       padding: const EdgeInsets.only(top: 8.0),
//                                       child: Container(
//                                         color: Colors.red,
//                                         width: _containerWidth,
//                                         height: _containerWidth / 2,
                                        
//                                       ),
//                                     )
                                
//                             ],

//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
