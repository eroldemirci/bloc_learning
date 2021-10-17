import 'package:bloc_denemesi/havadurumu_bloc/bloc/weather_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class SehirController extends GetxController {
  RxString sehiradi = 'Adana'.obs;

  sehirSec(String sehir) {
    sehiradi = sehir.obs;

    update();
  }
}
