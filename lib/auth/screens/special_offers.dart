import 'package:fish_farm/auth/config/app_routes.dart';
import 'package:flutter/material.dart';

class SpecialOffer extends StatelessWidget {
  SpecialOffer({Key? key}) : super(key: key);

  List items = [
    {
      "name": "Hair",
      "image":
          "https://i.pinimg.com/564x/47/fb/9b/47fb9b84e768668d5147da009aa725d8.jpg",
      "description": "This is for straightening hair",
      "price": "90000",
      "Discount Price": "service price"
    },
    {
      "name": "Makeup",
      "image":
          "https://i.pinimg.com/564x/47/fb/9b/47fb9b84e768668d5147da009aa725d8.jpg",
      "description": "this is for bridal makeup makeup",
      "price": "90000",
      "Discount Price": "90000"
    },
    {
      "name": "Skin",
      "image":
          "https://i.pinimg.com/564x/47/fb/9b/47fb9b84e768668d5147da009aa725d8.jpg",
      "description": "this is for facial makeup facial makeup",
      "price": "90000",
      "Discount Price": "90000"
    },
    {
      "name": "serivice name",
      "image":
          "https://i.pinimg.com/564x/47/fb/9b/47fb9b84e768668d5147da009aa725d8.jpg",
      "description": "this service is for permanently curling hair  ",
      "price": "90000",
      "Discount Price": "90000"
    },
    {
      "name": "serivice name",
      "image":
          "https://i.pinimg.com/564x/47/fb/9b/47fb9b84e768668d5147da009aa725d8.jpg",
      "description": "this service is for permanently curling hair  ",
      "price": "90000",
      "Discount Price": "90000"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 10, left: 20),
          child: Wrap(
            runAlignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.start,
            // alignment: WrapAlignment.center,
            runSpacing: 20,
            spacing: 20,
            direction: Axis.horizontal,
            children: items
                .map((item) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(
                          0xfff0f5f9,
                        ),
                      ),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 200,
                              width: MediaQuery.of(context).size.width > 768
                                  ? 260
                                  : 174,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(9),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        (item['image']),
                                      ),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width > 768
                                  ? 260
                                  : 174,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(8)),
                              ),
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['name'],
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      item['description'],
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text('Rs. ' + item["price"]),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ))
                .toList(),
          )),
    );
  }
}