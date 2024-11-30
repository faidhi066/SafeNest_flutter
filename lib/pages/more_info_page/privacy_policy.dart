// Settings page.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';

class PrivacyPolicyPage extends ConsumerStatefulWidget {
  const PrivacyPolicyPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  ConsumerState<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

var moreInfoOptions = const [
  [
    "App Version:",
    "0.1.0",
    null,
  ],
  [
    "Collaborators",
    "See the team behind this app",
    null,
  ],
  [
    "Privacy Policy",
    "Read more",
    null,
  ],
];

class _PrivacyPolicyPageState extends ConsumerState<PrivacyPolicyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Color(0XFF7DA1C4),
          ),
          onPressed: () {
            Navigator.pop(context);
            // Return to previous page
          },
        ),
        title: Text(
          'Privacy Policy',
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: Theme.of(context).colorScheme.primary),
        ),
      ),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Sossoldi is build as an open source app. This service is provided by us at no cost and it is intended for use as is.\nWe are not interested in collecting any personal information. We believe such information is yours and yours alone. We do not store or transmit your personal details, nor do we include any advertising or analytics software that talks to third parties.\n',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                ),
                Text(
                  'What Information Do We Collect?\n',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                ),
                Text(
                  "Sossoldi does not collect any personal information or connect to the internet. Any information that you add in the app exist solely on your device and no where else.\n",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                ),
                Text(
                  'Changes to This Privacy Policy\n',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                ),
                Text(
                  'We may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes./nThis policy is effective as of 2024-01-01\n',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                ),
                Text(
                  'Contact us\n',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                ),
                RichText(
                  text: TextSpan(
                    text:
                        'If you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us at ',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Theme.of(context).colorScheme.primary),
                    children: [
                      TextSpan(
                        text: 'help.sossoldi@gmail.com',
                        style: const TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(Uri(
                              scheme: 'mailto',
                              path: 'help.sossoldi@gmail.com',
                              queryParameters: {
                                'subject': 'Request info',
                              },
                            ));
                          },
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
