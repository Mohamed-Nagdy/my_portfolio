import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../constants.dart';
import '../../../../enums/social_links.dart';
import '../../../../themes/style.dart';
import '../../../../utils/help_functions.dart';
import '../../../../widgets/primary_chip.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      color: isDark(context) ? graySwatch.shade800 : graySwatch.shade50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const PrimaryChip(text: 'Get in touch'),
          const SizedBox(height: 16),
          Text(
            "What’s next? Feel free to reach out to me if you're looking for a developer, have a query, or simply want to connect.",
            style: Theme.of(context).textTheme.labelMedium,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(FontAwesomeIcons.envelope),
              const SizedBox(width: 16),
              Text(
                myEmail,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 16),
              IconButton(
                icon: const Icon(FontAwesomeIcons.copy),
                onPressed: () async {
                  await Clipboard.setData(const ClipboardData(text: myEmail))
                      .then((_) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('$myEmail Copied Successfully'),
                      ),
                    );
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(FontAwesomeIcons.phone),
              const SizedBox(width: 16),
              Text(
                myPhone,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 16),
              IconButton(
                icon: const Icon(FontAwesomeIcons.copy),
                onPressed: () async {
                  await Clipboard.setData(const ClipboardData(text: myPhone))
                      .then((_) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('$myPhone Copied Successfully'),
                      ),
                    );
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 50),
          Text(
            'You may also find me on these platforms!',
            style: Theme.of(context).textTheme.labelSmall,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...SocialLinks.values.map(
                (e) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: InkWell(
                    onTap: () {
                      launchUrlString(e.link);
                    },
                    child: Icon(
                      e.icon,
                      color: e.color,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
