import 'package:flutter/material.dart';
import 'package:dynamic_path_url_strategy/dynamic_path_url_strategy.dart';
import 'package:go_router/go_router.dart';

import 'my_app.dart';

void main() {
  setPathUrlStrategy();

  // ensure URL changes in the address bar when using push / pushNamed
  GoRouter.optionURLReflectsImperativeAPIs = true;

  runApp(const MyApp());
}
