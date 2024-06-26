import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kenmack/ui/common/app_colors.dart';
import 'package:kenmack/ui/common/ui_helpers.dart';

class History extends StatefulWidget {
  @override
  State<History> createState() => _State();
}

class _State extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kcPrimaryColor,
        title: Text(
          'Tax history',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            height: 166,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'paid tax',
                        style:
                            TextStyle(fontSize: 16, color: Color(0xFF718EBF)),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.file_copy_outlined,
                          color: Color(0xFF718EBF),
                          size: 20,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    '₦ 23,000.00',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                verticalSpaceTiny,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '27/2/2024 13:22',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      verticalSpaceSmall,
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            'assets/images/arrowUp.svg',
                            color: Colors.red,
                            width: 24,
                            height: 20,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Declined',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.red,
                            ),
                          ),
                          SizedBox(width: 8),
                        ],
                      ),
                    ],
                  ),
                ),
                verticalSpaceTiny,
                Divider(
                  height: 1,
                  thickness: 0.5,

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Enumerator',
                        style: TextStyle(color: kcPrimaryColor),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'taye ojo',
                          style: TextStyle(fontSize: 16),
                        ),
                        Icon(
                          Icons.person_2_outlined,
                        ),
                        SizedBox(width: 8),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
