import 'package:flutter/material.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:spacex/models/rocketInfoModle.dart';

class MobileRocketsList extends StatefulWidget {
  const MobileRocketsList({super.key, required this.rocketList});
  final List<dynamic> rocketList;

  @override
  State<MobileRocketsList> createState() => _MobileRocketsListState();
}

class _MobileRocketsListState extends State<MobileRocketsList>
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
      appBar: AppBar(
        title: Text("rocket"),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Wrap(
                runAlignment: WrapAlignment.center,
                children: [
                  ...List.generate(widget.rocketList.length,
                      (index) => InfoCard(rocket: widget.rocketList[index]))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget InfoCard({required RocketInfoModel rocket}) {
    return InkWell(
      onTap: () {
        context.go('/rocket-Info/${rocket.id}');
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Card(
          color: Color.fromARGB(255, 209, 225, 237),
          elevation: 7,
          child: SizedBox(
            width: 170,
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.network(
                    rocket.flickrImages![0],
                    fit: BoxFit.fill,
                    height: 100,
                  ),
                  Row(
                    children: [
                      Icon(Icons.rocket),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        color: Color.fromARGB(255, 3, 61, 109),
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          child: SizedBox(
                            width: 80,
                            child: Text(
                              rocket.country!,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 150,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "${rocket.name!} With ${rocket.firstStage!.engines.toString()} Engines",
                        style: TextStyle(fontWeight: FontWeight.w700),
                        maxLines: 2,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
