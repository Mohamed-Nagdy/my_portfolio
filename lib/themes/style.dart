import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color eventsBackgroundColor = Color(0XFFEEF2F3);
const Color whiteColor = Colors.white;
const Color blackColor = Color(0xFF1B2124);
const Color successGreen = Color(0xFF56CA00);
const Color warningYellow = Color(0xFFFFB400);
const Color dangerRed = Color(0xFFFF0000);
const Color primaryColor = Color.fromARGB(255, 17, 111, 200);
const Color secondaryColor = Color.fromARGB(255, 56, 198, 230);
const Color blueColor = Color(0XFF005DCA);

const MaterialColor graySwatch = MaterialColor(0XFF000000, {
  50: Color(0xFFF8FAFC),
  100: Color(0xFFF1F5F9),
  200: Color(0xFFE2E8F0),
  300: Color(0xFFCBD5E1),
  400: Color(0xFF94A3B8),
  500: Color(0xFF64748B),
  600: Color(0xFF475569),
  700: Color(0xFF334155),
  800: Color(0xFF1E293B),
  900: Color(0xFF0F172A),
});

final fontFamily = GoogleFonts.cairo().fontFamily;

ThemeData appTheme(String? usedFontFamily) {
  return ThemeData(
    brightness: Brightness.light,
    primaryIconTheme: IconThemeData(
      color: graySwatch.shade600,
      size: 24,
    ),
    dataTableTheme: DataTableThemeData(
      dataRowColor: const WidgetStatePropertyAll(whiteColor),
      dividerThickness: 1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: primaryColor,
            blurRadius: 10,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
      horizontalMargin: 16,
      headingTextStyle: TextStyle(
        color: const Color(0xDD3A3541),
        fontSize: 18,
        fontFamily: fontFamily,
        fontWeight: FontWeight.w900,
        height: 0.17,
        letterSpacing: 0.17,
      ),
    ),
    iconTheme: IconThemeData(
      color: graySwatch.shade600,
      size: 24,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      color: graySwatch.shade50,
      toolbarHeight: 64,
      titleTextStyle: TextStyle(
        color: graySwatch.shade900,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        fontFamily: usedFontFamily,
      ),
      iconTheme: IconThemeData(
        color: graySwatch.shade600,
        size: 24,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 1,
      backgroundColor: whiteColor,
      selectedLabelStyle: TextStyle(
        fontFamily: usedFontFamily,
        color: graySwatch.shade900,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: TextStyle(
        fontFamily: usedFontFamily,
        color: graySwatch.shade600,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      unselectedIconTheme: IconThemeData(color: graySwatch.shade600),
      selectedIconTheme: const IconThemeData(color: primaryColor),
      showUnselectedLabels: true,
      showSelectedLabels: true,
      selectedItemColor: graySwatch.shade900,
      unselectedItemColor: graySwatch.shade600,
    ),
    primaryColor: primaryColor,
    colorScheme: ColorScheme.light(
      surface: graySwatch.shade50,
      secondary: secondaryColor,
      primary: primaryColor,
    ),
    expansionTileTheme: const ExpansionTileThemeData(
      iconColor: primaryColor,
      textColor: primaryColor,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.resolveWith(
          (states) => primaryColor,
        ),
      ),
    ),
    fontFamily: usedFontFamily,
    scaffoldBackgroundColor: whiteColor,
    drawerTheme: DrawerThemeData(backgroundColor: graySwatch.shade50),
    cardColor: Colors.white,
    secondaryHeaderColor: const Color(0XFF262d31),
    dividerColor: graySwatch.shade200,
    dividerTheme: DividerThemeData(
      color: graySwatch.shade200,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: graySwatch.shade900,
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        color: graySwatch.shade900,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        color: graySwatch.shade900,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: TextStyle(
        color: graySwatch.shade900,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      labelMedium: TextStyle(
        color: graySwatch.shade900,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: TextStyle(
        color: graySwatch.shade900,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      headlineLarge: TextStyle(
        color: graySwatch.shade900,
        fontSize: 30,
        fontWeight: FontWeight.w600,
      ),
      headlineMedium: TextStyle(
        color: graySwatch.shade900,
        fontSize: 26,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle(
        color: graySwatch.shade900,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      weekdayStyle: TextStyle(
        color: graySwatch.shade900,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      dayStyle: TextStyle(
        color: graySwatch.shade900,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      yearStyle: TextStyle(
        color: graySwatch.shade900,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

ThemeData darkTheme(String? usedFontFamily) {
  return ThemeData(
    brightness: Brightness.dark,
    primaryIconTheme: IconThemeData(
      color: graySwatch.shade200,
      size: 24,
    ),
    dataTableTheme: DataTableThemeData(
      dividerThickness: 1,
      headingTextStyle: TextStyle(
        color: whiteColor,
        fontSize: 18,
        fontFamily: fontFamily,
        fontWeight: FontWeight.w900,
        height: 0.17,
        letterSpacing: 0.17,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color(0x193A3541),
            blurRadius: 10,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
      horizontalMargin: 16,
    ),
    iconTheme: IconThemeData(
      color: graySwatch.shade200,
      size: 24,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      color: graySwatch.shade800,
      toolbarHeight: 64,
      titleTextStyle: TextStyle(
        color: graySwatch.shade50,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        fontFamily: usedFontFamily,
      ),
      iconTheme: IconThemeData(
        color: graySwatch.shade300,
        size: 24,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 1,
      backgroundColor: graySwatch.shade900,
      selectedLabelStyle: TextStyle(
        fontFamily: usedFontFamily,
        color: graySwatch.shade100,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: TextStyle(
        fontFamily: usedFontFamily,
        color: graySwatch.shade100,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      unselectedIconTheme: IconThemeData(color: graySwatch.shade100),
      selectedIconTheme: IconThemeData(color: graySwatch.shade100),
      showUnselectedLabels: true,
      showSelectedLabels: true,
      selectedItemColor: graySwatch.shade100,
      unselectedItemColor: graySwatch.shade300,
    ),
    primaryColor: primaryColor,
    colorScheme: ColorScheme.dark(
      surface: graySwatch.shade900,
      secondary: secondaryColor,
      primary: primaryColor,
    ),
    expansionTileTheme: const ExpansionTileThemeData(
      iconColor: primaryColor,
      textColor: primaryColor,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.resolveWith(
          (states) => primaryColor,
        ),
      ),
    ),
    fontFamily: usedFontFamily,
    scaffoldBackgroundColor: graySwatch.shade900,
    drawerTheme: DrawerThemeData(backgroundColor: graySwatch.shade800),
    cardColor: graySwatch.shade800,
    dividerColor: graySwatch.shade600,
    dividerTheme: DividerThemeData(
      color: graySwatch.shade600,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: graySwatch.shade200,
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        color: graySwatch.shade200,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        color: graySwatch.shade200,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: TextStyle(
        color: graySwatch.shade200,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      labelMedium: TextStyle(
        color: graySwatch.shade200,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: TextStyle(
        color: graySwatch.shade200,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      headlineLarge: TextStyle(
        color: graySwatch.shade200,
        fontSize: 30,
        fontWeight: FontWeight.w600,
      ),
      headlineMedium: TextStyle(
        color: graySwatch.shade200,
        fontSize: 26,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle(
        color: graySwatch.shade200,
        fontSize: 22,
        fontWeight: FontWeight.w600,
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      weekdayStyle: TextStyle(
        color: graySwatch.shade200,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      dayStyle: TextStyle(
        color: graySwatch.shade200,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      yearStyle: TextStyle(
        color: graySwatch.shade200,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
