import 'package:get/get.dart';

import '../constants/constant_language.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      ConstantLanguage.login: 'Login',
      ConstantLanguage.home: 'Home',
      ConstantLanguage.username: 'Username',
      ConstantLanguage.password: 'Password',
      ConstantLanguage.dashboard: 'Dashboard',
    },
    'km_KH': {
      ConstantLanguage.login: 'ចូល',
      ConstantLanguage.home: 'ទំព័រដើម',
      ConstantLanguage.username: 'ឈ្មោះអ្នកប្រើប្រាស់',
      ConstantLanguage.password: 'លេខសម្ងាត់',
      ConstantLanguage.dashboard: 'Dashboard',
    },
  };
}
