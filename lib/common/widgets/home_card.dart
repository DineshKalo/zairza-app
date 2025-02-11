import 'package:flutter/material.dart';
import 'package:zairza_app/common/widgets/tags.dart';
import 'package:zairza_app/constants/global_variables.dart';

import '../../models/event_model.dart';

class HomeCard extends StatelessWidget {
  final Event event;
  const HomeCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/home_card', arguments: event.id);
      },
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: width * 0.55581395348,
                height: height * 0.17167381974,
                decoration: BoxDecoration(
                  boxShadow: GlobalVariables.shadowEffect,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 0.5),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    child:Image.network(
                      event.eventImg, // Use event image from API
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/images/HomeCard1.png', // Fallback image
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child:  Text(
                    _formatDate(event.dateAndTime),
                    style: GlobalVariables.textBold_14,
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: width * 0.55581395348,
            decoration: BoxDecoration(
              boxShadow: GlobalVariables.shadowEffect,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.wing.toUpperCase(),
                  style: GlobalVariables.textMedium_12.copyWith(
                    color: GlobalVariables.primaryColor,
                    height: 1,
                  ),
                ),
                SizedBox(
                  width: width * 0.5390625,
                  child: Text(
                    event.title,
                    style: GlobalVariables.textMedium_16.copyWith(height: 1.35),
                  ),
                ),
                SizedBox(height: height * 0.00643776824),
                Row(
                  children: [
                    Tags(tagName:event.wing),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                      child: Tags(tagName: '...'),
                    ),

                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

String _formatDate(DateTime date) {
  return "${date.day}th ${_getMonthName(date.month)} ${date.year}";
}

String _getMonthName(int month) {
  const months = [
    "Jan", "Feb", "Mar", "Apr", "May", "Jun",
    "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
  ];
  return months[month - 1];
}
