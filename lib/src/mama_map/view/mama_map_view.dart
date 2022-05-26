import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:get/get.dart';

import 'package:getwidget/getwidget.dart';
import 'package:latlong2/latlong.dart';
import 'package:mama_app_flutter/src/mama_map/model/mama_map_model.dart';

import '../controller/mama_map_view_controller.dart';

class MamaMapView extends StatelessWidget {
  const MamaMapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MamaMapViewController _mamaMapViewController =
        Get.put(MamaMapViewController());
    return Obx(
      () => _mamaMapViewController.mamaMapLoading.value
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GFLoader(type: GFLoaderType.ios, size: GFSize.LARGE),
                SizedBox(
                  height: 12.0,
                ),
                Text('Mama Haritasi Yukleniyor....'),
              ],
            )
          : Flexible(
              child: Container(
                child: FlutterMap(
                  options: MapOptions(
                    center: LatLng(37.063808368956155, 37.36544492909779),
                    zoom: _mamaMapViewController.zoomMap.value,
                  ),
                  layers: [
                    MarkerLayerOptions(
                      markers: [
                        for (MamaMapModel list
                            in _mamaMapViewController.mamaMapPointList)
                          Marker(
                            width: 80.0,
                            height: 80.0,
                            point: LatLng(
                              list.position!.longitude != null
                                  ? list.position!.longitude!
                                  : 37.30,
                              list.position!.latitude != null
                                  ? list.position!.latitude!
                                  : 37.0,
                            ),
                            builder: (ctx) => Container(
                              child: Icon(Icons.location_on,
                                  color: Colors.red, size: 32.0),
                            ),
                          ),
                      ],
                    ),
                  ],
                  children: <Widget>[
                    TileLayerWidget(
                        options: TileLayerOptions(
                            urlTemplate:
                                "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                            subdomains: ['a', 'b', 'c'])),

                    // MarkerLayerWidget(
                    //     options: MarkerLayerOptions(
                    //   markers: [
                    //     Marker(
                    //       width: 80.0,
                    //       height: 80.0,
                    //       point: LatLng(37, 37),
                    //       builder: (ctx) => Container(
                    //         child: FlutterLogo(),
                    //       ),
                    //     ),
                    //   ],
                    // )),
                  ],
                ),
              ),
            ),
    );
  }
}
