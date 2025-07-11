import 'dart:async';
import 'dart:developer';

import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'finances_app.dart';

void main()  {
  runApp(const ProviderScope(child: FinancesApp()));
}
