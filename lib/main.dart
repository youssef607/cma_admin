import 'package:cma_admin/app/di.dart';
import 'package:flutter/cupertino.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(MyApp());
}
