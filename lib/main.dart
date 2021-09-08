import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app_widget.dart';

void main() {
  initializeDateFormatting('pt_br').then((value) => runApp(AppWidget()));
}
