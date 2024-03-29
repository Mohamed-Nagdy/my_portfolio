import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../constants.dart';
import '../../../../enums/social_links.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../themes/style.dart';
import '../../../../utils/help_functions.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: ResponsiveRowColumn(
        layout: isMobile || isTablet
            ? ResponsiveRowColumnType.COLUMN
            : ResponsiveRowColumnType.ROW,
        columnCrossAxisAlignment: CrossAxisAlignment.center,
        rowCrossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ResponsiveRowColumnItem(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: isDark(context)
                        ? graySwatch.shade700
                        : graySwatch.shade400,
                    offset: const Offset(10, 10),
                  ),
                ],
              ),
              child: isDark(context)
                  ? Assets.images.blackWhite.image(
                      height: isMobile ? 220 : 320,
                      width: isMobile ? 180 : 280,
                    )
                  : Assets.images.colored.image(
                      height: isMobile ? 220 : 320,
                      width: isMobile ? 180 : 280,
                    ),
            )
                .animate()
                .slide(duration: const Duration(milliseconds: 500))
                .fadeIn(duration: const Duration(milliseconds: 500)),
          ),
          const ResponsiveRowColumnItem(child: SizedBox(width: 32)),
          const ResponsiveRowColumnItem(child: SizedBox(height: 32)),
          ResponsiveRowColumnItem(
            child: SizedBox(
              width: isMobile || isTablet
                  ? ResponsiveBreakpoints.of(context).screenWidth
                  : ResponsiveBreakpoints.of(context).screenWidth - 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    mainAboutTitle,
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    aboutMeShort,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: isDark(context)
                              ? graySwatch.shade400
                              : graySwatch.shade500,
                        ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    aboutMeLong,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: isDark(context)
                              ? graySwatch.shade400
                              : graySwatch.shade500,
                        ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Assets.images.location.image(width: 24, height: 24),
                      const SizedBox(width: 8),
                      Text(
                        myAddress,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: CircleAvatar(
                          radius: 5,
                          backgroundColor: successGreen,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Available for new projects',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      ...SocialLinks.values.map(
                        (e) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: InkWell(
                            onTap: () {
                              launchUrlString(
                                e.link,
                                mode: LaunchMode.externalApplication,
                              );
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
            )
                .animate()
                .slideX(duration: const Duration(milliseconds: 500))
                .fadeIn(duration: const Duration(milliseconds: 500)),
          ),
        ],
      ),
    );
  }
}
