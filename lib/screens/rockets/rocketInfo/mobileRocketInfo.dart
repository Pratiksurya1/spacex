import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:spacex/models/rocketInfoModle.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class MobileRocketInfo extends StatefulWidget {
  const MobileRocketInfo({super.key, required this.rocket});
  final RocketInfoModel rocket;

  @override
  State<MobileRocketInfo> createState() => _MobileRocketInfoState();
}

class _MobileRocketInfoState extends State<MobileRocketInfo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Rocket Info")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                width: double.infinity,
                height: 40,
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      widget.rocket.name!,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    )),
              ),
              FanCarouselImageSlider(
                initalPageIndex: 0,
                imagesLink: widget.rocket.flickrImages!,
                isAssets: false,
                autoPlay: false,
                sliderHeight: 300,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    widget.rocket.description!,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Info(
                  title: "Cost per launch",
                  value: widget.rocket.costPerLaunch.toString()),
              Info(
                  title: "Success Rate percen",
                  value: "${widget.rocket.successRatePct.toString()} %"),
              Info(title: "Height", value: ""),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Info(
                    title: "Meters",
                    value: widget.rocket.height!.meters.toString()),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Info(
                    title: "Feet",
                    value: widget.rocket.height!.feet.toString()),
              ),
              Info(title: "Diameter", value: ""),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Info(
                    title: "Meters",
                    value: widget.rocket.diameter!.meters.toString()),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Info(
                    title: "Feet",
                    value: widget.rocket.diameter!.feet.toString()),
              ),
              Info(
                  title: "Active Status",
                  value: widget.rocket.active.toString()),
              InkWell(
                child: Text(
                  "Wikipedia link",
                  style: TextStyle(color: Colors.blue),
                ),
                onTap: () => _launchUrl(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget Info({required String title, required String value}) {
    return Row(
      children: [
        Text(
          "$title : ",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: TextStyle(fontWeight: FontWeight.w200),
        )
      ],
    );
  }

  Future<void> _launchUrl() async {
    var _url = Uri.parse(widget.rocket.wikipedia!);
    if (!await launchUrl(
      _url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $_url');
    }
  }
}
