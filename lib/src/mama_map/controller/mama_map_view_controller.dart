import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:latlong2/latlong.dart';
import 'package:mama_app_flutter/src/mama_map/model/mama_map_model.dart';
import 'package:mama_app_flutter/src/mama_map/service/mama_map_service.dart';

class MamaMapViewController extends GetxController {
  RxBool mamaMapLoading = true.obs;

  List<MamaMapModel> mamaMapPointList = [];

  @override
  void onInit() {
    // TODO: implement onInit
    fetchMamaMapPoint();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  fetchMamaMapPoint() async {
    try {
      var mamaMapPoint = await MamaMapService().fetchMamaMapPoint();

      if (mamaMapPoint != null) {
        mamaMapPointList = mamaMapPoint;
        print(mamaMapPointList);
      }
    } finally {
      mamaMapLoading.value = false;
    }
  }
}
