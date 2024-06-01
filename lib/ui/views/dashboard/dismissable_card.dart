

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DismissibleCard extends StatefulWidget {
  @override
  _DismissibleCardState createState() => _DismissibleCardState();
}

class _DismissibleCardState extends State<DismissibleCard> {
  bool _isVisible = true; // State to control visibility of the card

  @override
  Widget build(BuildContext context) {
    return _isVisible // Check the state to decide whether to build the card or an empty container
        ? Dismissible(
      key: Key('dismiss_card'),
      onDismissed: (direction) {
        // Handle the dismiss action
      },
      child: Card(
        color: Colors.blue.shade100, // Set the background color of the card
        margin: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 8.0),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'To provide a platform where Kenyan Nurses and Midwives can communicate and collaborate with other like-minded people or organisations, with the aim of striving for excellence.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white, // Set the text color that contrasts well with the blue background
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.blue.shade800, // Text color for the button
                  ),
                  onPressed: () {
                    setState(() {
                      _isVisible = false; // Set the state to hide the card
                    });
                  },
                  child: Text('HIDE'),
                ),
              ),
            ],
          ),
        ),
      ),
    )
        : Container(); // Empty container represents a hidden card
  }
}
