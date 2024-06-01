
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kenmack/ui/common/app_colors.dart';

class DriverCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String phoneNumber;
  final String category;
  final VoidCallback? onTap; // Callback for tap event

  const DriverCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.phoneNumber,
    required this.category,
    this.onTap, // Accept the onTap callback
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, // Use the onTap callback when the item is tapped
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white, // Replace with your color
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              imagePath,
              height: 45,
              width: 55,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: kcPrimaryColor
                    ),
                  ),
                  if (phoneNumber.isNotEmpty)
                    Text(
                      phoneNumber,
                      style: TextStyle(
                        color: Colors.grey.shade600, // Replace with your color
                        fontSize: 14,
                      ),
                    ),
                ],
              ),
            ),
            Text(
              category,
              style: TextStyle(
                color: kcPrimaryColor, // Replace with your color
                fontSize: 14,
              ),
            ),          ],
        ),
      ),
    );
  }

}