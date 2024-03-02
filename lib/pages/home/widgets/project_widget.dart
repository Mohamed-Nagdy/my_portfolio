import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../models/project.dart';
import '../../../themes/style.dart';
import '../../../utils/help_functions.dart';
import '../../../widgets/primary_chip.dart';

class ProjectWidget extends StatelessWidget {
  const ProjectWidget({super.key, this.project});
  final Project? project;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;
    final isMobileOrTablet = isMobile || isTablet;
    final skillsLenght =
        (project?.skills?.length ?? 0) > 6 ? 6 : (project?.skills?.length ?? 0);
    final imageId = project?.image?.split('/')[5];
    log('Image Id $imageId');

    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: ResponsiveRowColumn(
        layout: ResponsiveRowColumnType.ROW,
        children: [
          ResponsiveRowColumnItem(
            child: Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color:
                    isDark(context) ? graySwatch.shade700 : graySwatch.shade100,
                padding: EdgeInsets.all(isMobileOrTablet ? 8 : 32),
                child: Image.network(
                  'https://drive.usercontent.google.com/download?id=1FnHrrShQPsEUclaEmD-APBlFVK3AVOw0&authuser=0',
                  errorBuilder: (context, error, stackTrace) {
                    print('Error In Loading $error');
                    return const SizedBox();
                  },
                ),
              ),
            ),
          ),
          ResponsiveRowColumnItem(
            child: Expanded(
              child: Container(
                color: isDark(context) ? graySwatch.shade800 : whiteColor,
                width: double.infinity,
                height: double.infinity,
                padding: EdgeInsets.all(isMobileOrTablet ? 8 : 32),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${project?.title}',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      SizedBox(height: isMobileOrTablet ? 8 : 24),
                      Text(
                        '${project?.description}',
                        style: Theme.of(context).textTheme.bodyMedium,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: isMobileOrTablet ? 8 : 24),
                      Wrap(
                        alignment: WrapAlignment.start,
                        children: [
                          for (int i = 0; i < skillsLenght; i++)
                            Padding(
                              padding: const EdgeInsets.all(2),
                              child:
                                  PrimaryChip(text: '${project?.skills?[i]}'),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}