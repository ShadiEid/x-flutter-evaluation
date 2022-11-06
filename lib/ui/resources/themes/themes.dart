import 'package:flutter/material.dart';
import '../../../extensions/theme_extensions.dart';
import '../colors/colors.dart';
import '../colors/colors_night.dart';
import '../dimensions/dimensions.dart';
import 'transitions.dart';

const fontFamily = "Poppins";

/// -------------- App Theme -------------- ///
final ThemeData lightTheme = ThemeData(
  // Define the default brightness and colors.
  fontFamily: fontFamily,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  brightness: Brightness.light,
  primaryColor: DesignColors.primaryColor,
  dividerColor: DesignColors.grey,
  disabledColor: DesignColors.grey,
  backgroundColor: Colors.white,
  scaffoldBackgroundColor: DesignColors.secondaryBackgroundColor,
  colorScheme: const ColorScheme(
    primary: DesignColors.primaryColor,
    secondary: DesignColors.secondaryColor,
    surface: DesignColors.primaryColor,
    background: Colors.white,
    error: DesignColors.errorColor,
    onPrimary: Colors.white,
    onSecondary: DesignColors.secondaryColor,
    onSurface: Colors.black,
    onBackground: Color.fromRGBO(249, 249, 249, 1),
    onError: DesignColors.errorColor,
    brightness: Brightness.light,
  ),
  textTheme: textTheme(),
  elevatedButtonTheme: elevatedButtonTheme(),
  outlinedButtonTheme: outlinedButtonTheme(),
  textButtonTheme: textButtonTheme(),
  pageTransitionsTheme: pageTransitionsTheme(),
);

/// -------------- Page Transitions Animations -------------- ///
PageTransitionsTheme pageTransitionsTheme({bool darkMode = false}) => PageTransitionsTheme(
      builders: {
        TargetPlatform.android: SharedAxisTransitionBuilder(darkMode: darkMode),
        TargetPlatform.iOS: SharedAxisTransitionBuilder(darkMode: darkMode),
        TargetPlatform.windows: SharedAxisTransitionBuilder(darkMode: darkMode),
        TargetPlatform.macOS: SharedAxisTransitionBuilder(darkMode: darkMode),
        TargetPlatform.linux: SharedAxisTransitionBuilder(darkMode: darkMode),
      },
    );

/// -------------------------------------------------------- ///

/// ---------------------- Text Theme ---------------------- ///
TextTheme textTheme({bool darkMode = false}) {
  return TextTheme(
    button: const TextStyle(color: Colors.white),
    bodyText1: TextStyle(color: darkMode ? DesignColorsDark.textColor : DesignColors.textColor),
    bodyText2: TextStyle(color: darkMode ? DesignColorsDark.textColor : DesignColors.textColor),
  );
}

TextStyle outlinedButtonTextStyle({bool darkMode = false}) {
  final primaryColor = darkMode ? DesignColorsDark.primaryColor : DesignColors.primaryColor;
  return TextStyle(
    color: primaryColor,
    fontSize: 14,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.underline,
  );
}

TextStyle titleStyle(ThemeData theme) => TextStyle(
      color: theme.primaryColor,
      fontSize: normalText,
      fontWeight: FontWeight.w500,
    );

TextStyle hintStyle() => const TextStyle(fontSize: smallText, color: DesignColors.grey);

TextStyle errorStyle() => const TextStyle(fontSize: 10, color: DesignColors.errorColor);

TextStyle labelStyle(ThemeData themeData) => const TextStyle(
      fontSize: smallText,
      color: DesignColors.grey,
      fontWeight: FontWeight.w500,
    );

/// ----------------- [TextFormField] default border ----------------- ///
OutlineInputBorder textFormFieldEnabledBorder() => OutlineInputBorder(
      borderSide: const BorderSide(color: DesignColors.grey, width: 0.8),
      borderRadius: BorderRadius.circular(textFormFieldRadius),
    );

/// ----------------- [TextFormField] enabled border ----------------- ///
OutlineInputBorder textFormFieldFocusedBorder(ThemeData themeData) => OutlineInputBorder(
      borderSide: BorderSide(color: themeData.primaryColor, width: 2),
      borderRadius: BorderRadius.circular(textFormFieldRadius),
    );

/// ----------------- [TextFormField] error border ----------------- ///
OutlineInputBorder textFormFieldErrorBorder(ThemeData themeData) => OutlineInputBorder(
      borderSide: BorderSide(color: themeData.errorColor, width: 2),
      borderRadius: BorderRadius.circular(textFormFieldRadius),
    );

/// -------------------------------------------------------- ///

/// -------------------- Buttons Theme -------------------- ///
TextButtonThemeData textButtonTheme({bool darkMode = false}) {
  final primaryColor = darkMode ? DesignColorsDark.primaryColor : DesignColors.primaryColor;
  return TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(primaryColor),
      overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(buttonCorner)),
        ),
      ),
      textStyle: MaterialStateProperty.all<TextStyle>(
        const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
  );
}

OutlinedButtonThemeData outlinedButtonTheme({bool darkMode = false}) {
  final primaryColor = darkMode ? DesignColorsDark.primaryColor : DesignColors.primaryColor;
  return OutlinedButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all<TextStyle>(outlinedButtonTextStyle(darkMode: darkMode)),
      foregroundColor: MaterialStateProperty.all<Color>(primaryColor),
      overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
      side: MaterialStateProperty.all<BorderSide>(BorderSide(color: primaryColor)),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(10)),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(buttonCorner)),
        ),
      ),
    ),
  );
}

ElevatedButtonThemeData elevatedButtonTheme({bool darkMode = false}) {
  final primaryColor = darkMode ? DesignColorsDark.primaryColor : DesignColors.primaryColor;
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      surfaceTintColor: primaryColor,
      padding: const EdgeInsets.all(10),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(buttonCorner))),
      textStyle: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontFamily: fontFamily,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}

/// -------------------------------------------------------- ///

/// -------------------- Box Shadow ---------------------- ///
const boxShadow = BoxShadow(blurRadius: 3, color: Color.fromRGBO(0, 0, 0, 0.18));

BoxDecoration cardDecoration(ThemeData theme) => BoxDecoration(
      color: theme.isDark() ? theme.scaffoldBackgroundColor : theme.backgroundColor,
      borderRadius: BorderRadius.circular(unitAndHalf),
      boxShadow: const [boxShadow],
    );

const largeTextStyle = TextStyle(fontSize: largeText, fontWeight: FontWeight.w700);
const mediumTextStyle = TextStyle(fontSize: mediumText, fontWeight: FontWeight.w600);
const normalTextStyle = TextStyle(fontSize: normalText, fontWeight: FontWeight.w500);
const smallTextStyle = TextStyle(fontSize: smallText, fontWeight: FontWeight.w400);
