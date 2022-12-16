import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:car_rental/shared/styles/colors.dart';

import 'razorpay_controller.dart';

class RazorpayView extends GetView<RazorpayController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<RazorpayController>(
        builder: (_) => Scaffold(
            backgroundColor: Colors.grey[200],
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: kPrimaryColor,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Car Rental',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    'Payment',
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
                  )
                ],
              ),
              elevation: 0,
              actions: [
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.close))
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(color: kPrimaryColor),
                          child: Text(
                            '₹ 3500',
                            style: TextStyle(fontSize: 22, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    child: Text(
                      'Choose Method',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    child: CheckboxListTile(
                      value: controller.dc,
                      selected: controller.dc,
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text(
                        'Debit Cards',
                        style: TextStyle(color: Colors.black, fontSize: 24),
                      ),
                      onChanged: (val) {
                        controller.dc = val;
                        controller.update();
                      },
                    ),
                  ),
                  buildCardView(),
                  Container(
                    child: CheckboxListTile(
                      value: controller.cc,
                      selected: controller.cc,
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text(
                        'Credit Cards',
                        style: TextStyle(color: Colors.black, fontSize: 24),
                      ),
                      onChanged: (val) {
                        controller.cc = val;
                        controller.update();
                      },
                    ),
                  ),
                  buildCardView(),
                  Container(
                    child: CheckboxListTile(
                      value: controller.pp,
                      selected: controller.pp,
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text(
                        'PayPal',
                        style: TextStyle(color: Colors.black, fontSize: 24),
                      ),
                      onChanged: (val) {
                        controller.pp = val;
                        controller.update();
                      },
                    ),
                  ),
                  buildPayButton(context),
                ],
              ),
            )),
      ),
    );
  }

  Widget buildCardView() {
    return Container(
      height: 210,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4.0,
              color: Colors.blue[900],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
              child: Container(
                height: 200,
                width: 350,
                padding: EdgeInsets.fromLTRB(16, 12, 16, 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Card No.',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Text(
                      '1234 5678 1234 5678',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Text(
                      '03/24',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Ratheesh Vijayan',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: Image.asset(
                            'assets/images/dealers/avis.png',
                            height: 30,
                            width: 50,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget buildPayButton(context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.11,
      child: ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(36.0),
            )),
            backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor)),
        onPressed: () {},
        child: Text(
          'Pay Now',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
    );
  }
}
