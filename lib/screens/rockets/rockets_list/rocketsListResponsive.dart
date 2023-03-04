import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:spacex/models/rocketInfoModle.dart';

import '../../../shared/API/rocketsAPI.dart';
import 'mobileRocketsList.dart';

class RocketsListResponsive extends StatelessWidget {
  const RocketsListResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 251, 255, 0.965),
      body: FutureBuilder<List<dynamic>>(
        future: getAllRocketsList(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('No Found !'),
            );
          } else if (snapshot.hasData) {
            return LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < 600) {
                  return MobileRocketsList(rocketList: snapshot.data!);
                } else if (constraints.maxWidth < 1280) {
                  return MobileRocketsList(rocketList: snapshot.data!);
                } else {
                  return MobileRocketsList(rocketList: snapshot.data!);
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
