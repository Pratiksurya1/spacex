import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:spacex/models/rocketInfoModle.dart';

import '../../../shared/API/rocketsAPI.dart';
import 'mobileRocketInfo.dart';

class RocketInfoResponsive extends StatelessWidget {
  const RocketInfoResponsive({super.key, required this.Id});
  final String Id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 251, 255, 0.965),
      body: FutureBuilder<dynamic>(
        future: getInfoById(Id),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('No Found !'),
            );
          } else if (snapshot.hasData) {
            return LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < 600) {
                  return MobileRocketInfo(rocket: snapshot.data!);
                } else if (constraints.maxWidth < 1280) {
                  return MobileRocketInfo(rocket: snapshot.data!);
                } else {
                  return MobileRocketInfo(rocket: snapshot.data!);
                }
              },
            );
          } else {
            return Center(
              child: LoadingAnimationWidget.discreteCircle(
                  color: Colors.blue, size: 50),
            );
          }
        },
      ),
    );
  }
}
