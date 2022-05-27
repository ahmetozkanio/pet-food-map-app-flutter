import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:get/get.dart';

import 'package:getwidget/getwidget.dart';
import 'package:latlong2/latlong.dart';
import 'package:mama_app_flutter/src/mama_map/model/mama_map_model.dart';

import '../controller/mama_map_view_controller.dart';

class MamaMapView extends StatefulWidget {
  const MamaMapView({Key? key}) : super(key: key);

  @override
  State<MamaMapView> createState() => _MamaMapViewState();
}

class _MamaMapViewState extends State<MamaMapView> {
  double zoomMap = 12.0;

  MapController mapController = MapController();
  LatLng latLong = LatLng(37.063808368956155, 37.36544492909779);

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
          : FlutterMap(
              mapController: mapController,
              options: MapOptions(
                center: LatLng(37.063808368956155, 37.36544492909779),
                zoom: zoomMap,
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
                Stack(
                  children: [
                    TileLayerWidget(
                        options: TileLayerOptions(
                            urlTemplate:
                                "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                            subdomains: ['a', 'b', 'c'])),
                    Positioned(
                      right: 0.0,
                      top: 0.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              zoomIncrement();

                              print(zoomMap);
                            },
                            child: Text('+'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              zoomDecrement();
                            },
                            child: Text('-'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }

  zoomIncrement() {
    setState(() {
      zoomMap = zoomMap + 1.0;

      mapController.move(latLong, zoomMap);
    });
  }

  zoomDecrement() {
    setState(() {
      zoomMap = zoomMap - 1.0;

      mapController.move(latLong, zoomMap);
    });
  }
}
