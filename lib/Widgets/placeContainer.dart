import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class PlaceContainer extends StatelessWidget {
  const PlaceContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 15.0,left: 15.0,right: 10),
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.white,
            blurRadius: 1.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Image(
                  image: AssetImage('assets/imgs/bg.png'),
                  width: 55,
                  height: 62,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Text(
                    "Bosporus",
                    style: TextStyle(fontSize: 14,fontFamily: 'Poppins',fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.secondaryContainer,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.defaultDialog(
                    backgroundColor: Colors.white,
                    title: 'Remove Place',
                    middleText: 'Are you sure you want to remove this place?',
                    actions: [
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text('Delete'),
                      ),
                    ],
                  );
                },
                child: Container(
                  width: 37,
                  height: 37,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Image(
                    image: AssetImage('assets/imgs/Group 57615.png'),
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 13),
            child: Row(
              children: [
                const Image(
                  width: 26,
                  height: 26,
                  image: AssetImage('assets/imgs/Group 57572.png'),
                ),
                const SizedBox(width: 15),
                Flexible(
                  child: RatingBarIndicator(
                    rating: 2.75,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star_purple500_outlined,
                      color: Colors.amber,
                    ),
                    itemCount: 3,
                    itemSize: 25.0,
                    unratedColor: Colors.grey,
                    direction: Axis.horizontal,
                  ),
                ),
                const SizedBox(width: 90),
                const Image(
                  width: 26,
                  height: 26,
                  image: AssetImage('assets/imgs/Group 57474.png'),
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: RatingBarIndicator(
                    rating: 2.75,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star_purple500_outlined,
                      color: Colors.amber,
                    ),
                    itemCount: 3,
                    itemSize: 25.0,
                    unratedColor: Colors.grey,
                    direction: Axis.horizontal,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 13, top: 20),
            child: Row(
              children: [
                const Image(
                  width: 26,
                  height: 26,
                  image: AssetImage('assets/imgs/Group 57580.png'),
                ),
                const SizedBox(width: 15),
                Flexible(
                  child: RatingBarIndicator(
                    rating: 2.75,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star_purple500_outlined,
                      color: Colors.amber,
                    ),
                    itemCount: 3,
                    itemSize: 25.0,
                    unratedColor: Colors.grey,
                    direction: Axis.horizontal,
                  ),
                ),
                const SizedBox(width: 90),
                const Image(
                  width: 26,
                  height: 26,
                  image: AssetImage('assets/imgs/Group 57478.png'),
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: RatingBarIndicator(
                    rating: 2.75,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star_purple500_outlined,
                      color: Colors.amber,
                    ),
                    itemCount: 3,
                    itemSize: 25.0,
                    unratedColor: Colors.grey,
                    direction: Axis.horizontal,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
