import 'package:get/get.dart';

import '../modules/fingerandfaceauth/bindings/fingerandfaceauth_binding.dart';
import '../modules/fingerandfaceauth/views/fingerandfaceauth_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/imagepicker/bindings/imagepicker_binding.dart';
import '../modules/imagepicker/views/imagepicker_view.dart';
import '../modules/signaturetoimage/bindings/signaturetoimage_binding.dart';
import '../modules/signaturetoimage/views/signaturetoimage_view.dart';
import '../modules/speechTotext/bindings/speech_totext_binding.dart';
import '../modules/speechTotext/views/speech_totext_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      children: [
        GetPage(
          name: _Paths.HOME,
          page: () => const HomeView(),
          binding: HomeBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.IMAGEPICKER,
      page: () => const ImagepickerView(),
      binding: ImagepickerBinding(),
    ),
    GetPage(
      name: _Paths.FINGERANDFACEAUTH,
      page: () => const FingerandfaceauthView(),
      binding: FingerandfaceauthBinding(),
    ),
    GetPage(
      name: _Paths.SPEECH_TOTEXT,
      page: () => const SpeechTotextView(),
      binding: SpeechTotextBinding(),
    ),
    GetPage(
      name: _Paths.SIGNATURETOIMAGE,
      page: () => const SignaturetoimageView(),
      binding: SignaturetoimageBinding(),
    ),
  ];
}
