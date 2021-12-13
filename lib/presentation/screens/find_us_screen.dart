import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class FindUs extends StatelessWidget {
  const FindUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myMedia = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 40),
          child: Text('you can find us',
              style: Theme.of(context).textTheme.bodyText1),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: myMedia.width * 0.9,
              height: myMedia.height * 0.6,
              child: FlutterMap(
                options: MapOptions(
                  center: LatLng(30.033333, 31.233334),
                  zoom: 13.0,
                ),
                layers: [
                  TileLayerOptions(
                    urlTemplate:
                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c'],
                    attributionBuilder: (_) {
                      return const Text("© michael news app");
                    },
                  ),
                  MarkerLayerOptions(
                    markers: [
                      Marker(
                        width: 80.0,
                        height: 80.0,
                        point: LatLng(51.5, -0.09),
                        builder: (ctx) => Container(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
