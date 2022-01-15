import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jait_jait/components/const/custom_theme.dart';
import 'package:jait_jait/config/bindings/onboarding_bindings.dart';
import 'package:jait_jait/debug/calendar/home.dart';
import 'package:jait_jait/page/root.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init('onBoarding');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  void setStatusBar() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    setStatusBar();
    return GetMaterialApp(
      initialBinding: JaitBindings(),
      debugShowCheckedModeBanner: false,
      title: 'Jait Jait',
      theme: CustomTheme.custom,
      home: const Root(),
      builder: EasyLoading.init(),
    );
  }
}
