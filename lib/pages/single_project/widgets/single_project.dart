import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../models/project.dart';
import '../../../themes/style.dart';
import '../../../utils/help_functions.dart';
import '../../../widgets/primary_chip.dart';
import 'store_button.dart';

class SingleProjectWidget extends StatelessWidget {
  const SingleProjectWidget({
    required this.project,
    super.key,
  });
  final Project project;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;
    final isMobileOrTablet = isMobile || isTablet;

    return Container(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ResponsiveRowColumn(
              layout: isMobileOrTablet
                  ? ResponsiveRowColumnType.COLUMN
                  : ResponsiveRowColumnType.ROW,
              rowMainAxisAlignment: MainAxisAlignment.start,
              rowCrossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ResponsiveRowColumnItem(
                  child: Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: isDark(context)
                          ? graySwatch.shade800
                          : graySwatch.shade100,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          spreadRadius: 2,
                          blurRadius: 1,
                          offset: const Offset(2, 3),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(imageUrl: '${project.image}'),
                    ),
                  ),
                ),
                const ResponsiveRowColumnItem(child: SizedBox(width: 16)),
                const ResponsiveRowColumnItem(child: SizedBox(height: 16)),
                ResponsiveRowColumnItem(
                  child: SizedBox(
                    width: isMobileOrTablet
                        ? ResponsiveBreakpoints.of(context).screenWidth
                        : ResponsiveBreakpoints.of(context).screenWidth * 0.7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '${project.title}',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        SizedBox(height: isMobileOrTablet ? 8 : 24),
                        Text(
                          '${project.description}',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        SizedBox(height: isMobileOrTablet ? 8 : 24),
                        Wrap(
                          alignment: WrapAlignment.start,
                          children: [
                            for (int i = 0;
                                i < (project.skills?.length ?? 0);
                                i++)
                              Padding(
                                padding: const EdgeInsets.all(2),
                                child:
                                    PrimaryChip(text: '${project.skills?[i]}'),
                              ),
                          ],
                        ),
                        SizedBox(height: isMobileOrTablet ? 8 : 24),
                        Row(
                          children: [
                            if (project.googlePlay != null)
                              StoreButton(
                                icon: FontAwesomeIcons.googlePlay,
                                title: 'Google Play',
                                url: project.googlePlay,
                              ),
                            const SizedBox(width: 16),
                            if (project.appStore != null)
                              StoreButton(
                                icon: FontAwesomeIcons.appStore,
                                title: 'App Store',
                                url: project.appStore,
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              'Screen Shots',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 32),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.5,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CachedNetworkImage(
                      imageUrl: '${project.screenshots?[index]}',
                      errorWidget: (context, url, error) {
                        return const SizedBox();
                      },
                    ),
                  );
                },
                itemCount: project.screenshots?.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
