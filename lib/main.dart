import 'package:cma_admin/app/di.dart';
import 'package:flutter/cupertino.dart';
import 'app/app.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  setUrlStrategy(PathUrlStrategy());
  runApp(MyApp());
}
