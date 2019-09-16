// import 'package:flutter/material.dart';
// import 'dart:math' as math;

// /*
// Shows TradeCard's vertically, giving an option to 'see more'.
// Initially shows 3 TradeCards. After "SEE MORE" is pressed, the widget expands and shows 3 more cards.
// DEPRECATED. KEEPING JUST INCASE TO REUSE CODE.
// */

// class OrderColumn extends StatefulWidget {
//   //todo: stop the collapse from immediately erasing the contents.
//   double width;
//   String title;
//   String subtitle;
//   List<Order> orders;

//   OrderColumn({this.width, this.title, this.subtitle, this.orders});

//   @override
//   _OrderColumnState createState() =>
//       _OrderColumnState(width, title, subtitle, orders);
// }

// class _OrderColumnState extends State<OrderColumn>
//     with TickerProviderStateMixin {
//   Order genericOrder = Order(
//     //todo: couple OrderColumn for practical use.
//     time: "June 22 2019",
//     volume: 200000,
//     purchaser: "unknown",
//     ticker: "AAPL",
//     company: "Apple Incorporated",
//     price: 2,
//   );

//   double width;
//   double height;
//   double expandedHeight;
//   List<Order> orders;

//   String seeLess = "SEE LESS";
//   String seeMore = "SEE MORE";
//   String currentButtonText = "SEE MORE";

//   _OrderColumnState(
//       double width, String title, String subtitle, List<Order> orders) {
//     this.width = width;
//     this.height = width + width * 1 / 20; // Applying aspect ratio.
//     this.title = title;
//     this.subtitle = subtitle;
//     this.orders = orders;
//   }

//   String title;
//   String subtitle;

//   Animation<double> _rotateAnimation;
//   AnimationController _rotateController;

//   bool isOpen = false;

//   @override
//   void initState() {
//     super.initState();
//     _rotateController = AnimationController(
//       duration: const Duration(milliseconds: 500),
//       vsync: this,
//     );
//     _rotateAnimation = Tween(begin: 0.0, end: 100.0).animate(
//       CurvedAnimation(parent: _rotateController, curve: Curves.decelerate),
//     );
//   }

//   @override
//   void dispose() {
//     _rotateController.dispose();
//     super.dispose();
//   }

//   void handleTap() {
//     setState(() {
//       switch (_rotateController.status) {
//         //switch case needed so that the user can't break the animation by tapping on it very fast.
//         case AnimationStatus.forward:
//           _rotateController.reverse();
//           break;
//         case AnimationStatus.reverse:
//           _rotateController.forward();
//           break;
//         case AnimationStatus.dismissed:
//           _rotateController.forward();
//           break;
//         case AnimationStatus.completed:
//           _rotateController.reverse();
//           break;
//       }
//       if (isOpen == false) {
//         currentButtonText = seeLess;
//         isOpen = true;
//         height = height * 18 / 11;
//       } else {
//         currentButtonText = seeMore;
//         isOpen = false;
//         height = width + width * 1 / 20;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return OrientationBuilder(
//       builder: (context, orientation) {
//         Widget addOrder() {
//           return Center(
//             child: Padding(
//               padding: const EdgeInsets.only(top: 8),
//               child: Container()
//             ),
//           );
//         }

//         Widget addExtraOrders() {
//           if(isOpen == true) {
//             return addOrder();
//           } else {
//             return Container();
//           }
//         }

//         return Card(
//           margin: EdgeInsets.all(0.0),
//           shape: RoundedRectangleBorder(
//               side: BorderSide.none,
//               borderRadius: BorderRadius.all(const Radius.circular(8.0))),
//           elevation: 5.0,
//           child: AnimatedContainer(
//               curve: Curves.easeInOut,
//               duration: Duration(milliseconds: 500),
//               decoration: BoxDecoration(
//                   color: Theme.of(context).canvasColor,
//                   borderRadius: BorderRadius.all(Radius.circular(8.0))),
//               width: MediaQuery.of(context).size.width - 32,
//               height: height + 16,
//               child: Stack(
//                 children: <Widget>[
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Padding(
//                         padding: const EdgeInsets.only(top: 16, left: 16.0),
//                         child: Text(
//                           "$title",
//                           style: Theme.of(context).textTheme.display3,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 4.0, left: 16.0),
//                         child: Text(
//                           "$subtitle",
//                           style: Theme.of(context).textTheme.subtitle,
//                         ),
//                       ),
//                       Padding(
//                           padding: const EdgeInsets.only(top: 8.0),
//                           child: addOrder()),
//                       Center(
//                         child: Padding(
//                           padding: const EdgeInsets.only(top: 8),
//                           child: Container()
//                         ),
//                       ),
//                       Center(
//                         child: Padding(
//                           padding: const EdgeInsets.only(top: 8),
//                           child: Container()
//                         ),
//                       )
//                     ],
//                   ),
//                   Positioned(
//                     top: 300.0, //
//                     left: 14.0,
//                     child: Column(
//                       children: <Widget>[
//                         (isOpen == true) ? addOrder() : Container(),
//                         (isOpen == true) ? addOrder() : Container(),
//                         (isOpen == true) ? addOrder() : Container()
//                       ],
//                     ),
//                   ),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: <Widget>[
//                       Center(
//                         child: Container(
//                           width: MediaQuery.of(context).size.width - 16.0,
//                           height: 50.0,
//                           color: Theme.of(context).canvasColor,
//                           child: GestureDetector(
//                             onTap: () {
//                               print("should be opening");
//                               handleTap();
//                             },
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Text(
//                                   "$currentButtonText",
//                                   style: Theme.of(context).textTheme.button,
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(
//                                       bottom:
//                                           8.0), //todo: align iconbutton in a different way
//                                   child: AnimatedBuilder(
//                                       // rotates the top icon
//                                       animation: _rotateAnimation,
//                                       builder: (context, child) {
//                                         return Transform.rotate(
//                                           //todo: make the iconbutton look less fucking silly lol
//                                           angle:
//                                               _rotateController.value * math.pi,
//                                           child: IconButton(
//                                             icon: Icon(Icons.arrow_drop_down),
//                                             color:
//                                                 Theme.of(context).primaryColor,
//                                             iconSize: 40,
//                                             onPressed: () {
//                                               print("should be opening");
//                                               handleTap();
//                                             },
//                                           ),
//                                         );
//                                       }),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               )),
//         );
//       },
//     );
//   }
// }
