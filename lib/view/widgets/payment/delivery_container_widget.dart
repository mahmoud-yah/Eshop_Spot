import 'package:eshop_spot/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';

class DeliveryContainerWidget extends StatefulWidget {
  const DeliveryContainerWidget({Key? key}) : super(key: key);

  @override
  State<DeliveryContainerWidget> createState() =>
      _DeliveryContainerWidgetState();
}

class _DeliveryContainerWidgetState extends State<DeliveryContainerWidget> {
  int radioContainerIndex = 1;
  bool changeColor = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRadioContainer(
            address: 'Mazzeh-Damascus,Stria',
            name: 'eshop spot shop',
            phone: '995585465',
            title: 'Eshop Spot',
            value: 1,
            color: changeColor ? Colors.white : Colors.grey.shade300,
            onChanged: (int? value) {
              setState(() {
                radioContainerIndex = value!;
                changeColor = !changeColor;
              });
            }),
        const SizedBox(height: 10),
        buildRadioContainer(
            address: 'Mazzeh-Damascus,Stria',
            name: 'eshop spot shop',
            phone: '995585465',
            title: 'Eshop Spot',
            value: 2,
            color: changeColor ? Colors.grey.shade300 : Colors.white,
            onChanged: (int? value) {
              setState(() {
                radioContainerIndex = value!;
                changeColor = !changeColor;
              });
            }),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget buildRadioContainer({
    required Color color,
    required int value,
    required Function onChanged,
    required String name,
    required String title,
    required String phone,
    required String address,
  }) {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Radio(
            value: value,
            groupValue: radioContainerIndex,
            fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
            onChanged: (int? value) {
              onChanged(value);
            },
          ),
          const SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                TextUtils(
                  text: title,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                const SizedBox(height: 5),
                TextUtils(
                  text: name,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
                const SizedBox(height: 5),
                TextUtils(
                  text: phone,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
                const SizedBox(height: 5),
                TextUtils(
                  text: address,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
