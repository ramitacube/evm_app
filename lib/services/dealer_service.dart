import 'package:flutter/cupertino.dart';
import 'package:line_icons/line_icons.dart';

import '../core.dart';

class DealerService {
  List<Dealer> getDealerList() {
    return <Dealer>[
      Dealer(
        name: "Rent a Cab",
        image: Icon(LineIcons.car,size: 48,),
      ),
      Dealer(
        name: "Rent a Bike",
        offers: 126,
        image: Icon(LineIcons.biking,size: 48,),
      ),
      // Dealer(
      //   name: "Compact SUV",
      //   offers: 89,
      //   image: "assets/images/dealers/tesla.jpg",
      // ),
      // Dealer(
      //   name: "SUV",
      //   offers: 89,
      //   image: "assets/images/dealers/tesla.jpg",
      // ),
      // Dealer(
      //   name: "MUV",
      //   offers: 89,
      //   image: "assets/images/dealers/tesla.jpg",
      // ),
    ];
  }
}
