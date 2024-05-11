import 'package:acronyc_app/pages/introduction_animation/introduction_animation_screen.dart';
import 'package:acronyc_app/services/providers/user_input_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'not_used/navigation/custom_navigator_observer.dart';
import 'pages/home/home_page.dart';
import 'services/providers/filter_provider.dart';
import 'utiles/themes.dart';

class AppClass extends StatelessWidget {
  const AppClass({super.key, required this.isInitScreen});

  final int isInitScreen;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => FilterProvider(),
        ),
        ChangeNotifierProvider(create: (_) => UserInputProvider()),
      ],
      child: MaterialApp(
        navigatorObservers: [customNavigatorObserver],
        debugShowCheckedModeBanner: false,
        theme: MyThemes.getThemeFromKey(MyThemeKeys.LIGHT),
        home: isInitScreen == 1
            ? const HomePage()
            : const IntroductionAnimationScreen(),
      ),
    );
  }
}
