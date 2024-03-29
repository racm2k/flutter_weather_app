import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/src/core/data/models/location_model.dart';
import 'package:weather_app/src/features/map/map_ui.dart';
import 'package:weather_app/src/features/weather_details/presentation/user_interfaces/location_weather_details_screen.dart';
import 'package:weather_app/src/features/home/presentation/user_interfaces/home_screen.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final fontTheme = GoogleFonts.beVietnamProTextTheme();
    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Providing a restorationScopeId allows the Navigator built by the
      // MaterialApp to restore the navigation stack when a user leaves and
      // returns to the app after it has been killed while running in the
      // background.
      restorationScopeId: 'app',

      // Provide the generated AppLocalizations to the MaterialApp. This
      // allows descendant Widgets to display the correct translations
      // depending on the user's locale.
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,

      // Use AppLocalizations to configure the correct application title
      // depending on the user's locale.
      //
      // The appTitle is defined in .arb files found in the localization
      // directory.
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.appTitle,

      // Define a light and dark color theme. Then, read the user's
      // preferred ThemeMode (light, dark, or system default) from the
      // SettingsController to display the correct theme.
      theme: ThemeData(textTheme: fontTheme, useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.system,

      // Define a function to handle named routes in order to support
      // Flutter web url navigation and deep linking.
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            final args = routeSettings.arguments;
            switch (routeSettings.name) {
              case LocationWeatherDetailsScreen.routeName:
                final location = args as LocationModel;
                return LocationWeatherDetailsScreen(
                  location: location,
                );

              default:
                return const MapUI();
            }
          },
        );
      },
    );
  }
}
