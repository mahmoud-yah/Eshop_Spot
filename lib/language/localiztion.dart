import 'package:get/route_manager.dart';
import '../utils/my_string.dart';
import 'en.dart';
import 'fr.dart';
import 'ar.dart';
class LocaliztionApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        ene: en,
        ara: ar,
        frf: fr,
      };
}
