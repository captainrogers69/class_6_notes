import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pdfapplication/home_controller.dart';

final ChangeNotifierProvider<HomeController> homeControllerProvider =
    ChangeNotifierProvider<HomeController>((ref) {
  return HomeController();
});
