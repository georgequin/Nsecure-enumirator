import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:kenmack/ui/common/app_colors.dart';
import 'package:open_mail_app/open_mail_app.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app/app.locator.dart';
import '../../../state.dart';

class Support extends StatefulWidget {
  const Support({Key? key}) : super(key: key);

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  final TextEditingController feedbackController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Support",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          SupportOption(
            icon: Icons.email,
            title: "Email Us",
            subtitle: "info@kenmauk.com",
            onTap: () async {
              sendEmail("info@kenmauk.com", context, feedbackController);
            },
          ),
          // SupportOption(
          //   icon: Icons.call_end_outlined,
          //   title: "Call us",
          //   subtitle: "+2349065304004",
          //   onTap: () {
          //     _makePhoneCall("+2349065304004");
          //   },
          // ),
          SupportOption(
            icon: Icons.chat,
            title: "WhatsApp",
            subtitle: "Chat with us on whatsApp", // Replace with your WhatsApp number
            onTap: () {
              chatOnWhatsApp("+447500338033"); // Replace with your WhatsApp number
            },
          ),
          SupportOption(
            icon: Icons.feedback, // Use appropriate icon for feedback
            title: "Feedback",
            subtitle: "Provide your feedback",
            onTap: () {
              _showFeedbackDialog(context);
            },
          ),
          SupportOption(
            icon: Icons.help_outline,
            title: "FAQs",
            subtitle: "",
            onTap: () {
              goToFaqs('https://kenmauk.com/faq');
            },
          ),

        ],
      ),
    );
  }
}

Future<void> sendEmail(String emailAddress, BuildContext context, TextEditingController feedbackController) async {
  EmailContent email = EmailContent(
    to: [
      emailAddress,
    ],
    // bcc: ['georgequin19@gmail.com.com'],
  );

  OpenMailAppResult result =
  await OpenMailApp.composeNewEmailInMailApp(
      nativePickerTitle: 'Select email app to compose',
      emailContent: email);
  if (!result.didOpen && !result.canOpen) {
    showNoMailAppsDialog(context);
  } else if (!result.didOpen && result.canOpen) {
    showDialog(
      context: context,
      builder: (_) => MailAppPickerDialog(
        mailApps: result.options,
        emailContent: email,
      ),
    );
  }
}

void showNoMailAppsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Open Mail App"),
        content: const Text("No mail apps installed"),
        actions: <Widget>[
          TextButton(
            child: const Text("OK"),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      );
    },
  );
}

Future<void> _makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  await launchUrl(launchUri);
}

Future<void> goToFaqs(String url) async {
  final Uri toLaunch =
  Uri(scheme: 'https', host: 'www.kenmauk.com', path: '/faq');

  if (!await launchUrl(toLaunch, mode: LaunchMode.inAppBrowserView)) {
    throw Exception('Could not launch $url');
  }
}

Future<void> chatOnWhatsApp(String phoneNumber) async {
  // Format the phone number for WhatsApp URL
  String formattedPhoneNumber = phoneNumber.replaceAll('+', '').replaceAll(' ', '');
  final Uri whatsappUri = Uri.parse("https://wa.me/$formattedPhoneNumber");

  if (!await launchUrl(whatsappUri, mode: LaunchMode.inAppBrowserView)) {
    locator<SnackbarService>().showSnackbar(message: "WhatsApp not installed");
  }
}

Future<void> _launch(Uri url) async {
  await canLaunchUrl(url)
      ? await launchUrl(url)
      : locator<SnackbarService>().showSnackbar(message: "No app found");
}

void _showFeedbackDialog(BuildContext context) {
  TextEditingController feedbackController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Provide Feedback"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Your Feedback',
                hintText: 'Insert your feedback here...',
              ),
              maxLines: null,
              controller: feedbackController,
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: const Text("Cancel"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          TextButton(
            child: const Text("Send"),
            onPressed: () {
              // Send feedback via email
              sendFeedbackEmail(feedbackController.text);
            },
          ),
        ],
      );
    },
  );
}


void sendFeedbackEmail(String feedback) async {
  final Email email = Email(
    body: feedback,
    subject: 'Feedback from App ${profile.value.firstName}',
    recipients: ['info@kenmauk.com'],
  );

  try {
    await FlutterEmailSender.send(email);
    print('Email sent successfully');
  } catch (error) {
    print('Error sending email: $error');
  }
}


class SupportOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap; // Callback for tap event

  const SupportOption({
    Key? key,
    required this.icon,
    required this.title,
    this.subtitle = "",
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
            Icon(icon, color: kcPrimaryColor), // Replace with your color
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
                    ),
                  ),
                  if (subtitle.isNotEmpty)
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Colors.grey.shade600, // Replace with your color
                        fontSize: 14,
                      ),
                    ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.grey), // Replace with your color
          ],
        ),
      ),
    );
  }

}
