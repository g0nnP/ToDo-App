import 'package:flutter/material.dart';

import '../pages/home/home_page.dart';

Map<String, WidgetBuilder> appRoutes = {
  HomePage.screenName : (_) => const HomePage()
};