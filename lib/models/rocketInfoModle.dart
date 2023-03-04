import 'dart:convert';

RocketInfoModel rocketInfoModelFromJson(String str) => RocketInfoModel.fromJson(json.decode(str));

String rocketInfoModelToJson(RocketInfoModel data) => json.encode(data.toJson());

class RocketInfoModel {
    RocketInfoModel({
         this.height,
         this.diameter,
         this.mass,
         this.firstStage,
         this.secondStage,
         this.engines,
         this.landingLegs,
         this.payloadWeights,
         this.flickrImages,
         this.name,
         this.type,
         this.active,
        required this.costPerLaunch,
        required this.successRatePct,
         this.firstFlight,
         this.country,
         this.company,
         this.wikipedia,
         this.description,
         this.id,
    });

    Diameter? height;
    Diameter? diameter;
    Mass? mass;
    FirstStage? firstStage;
    SecondStage? secondStage;
    Engines? engines;
    LandingLegs? landingLegs;
    List<PayloadWeight>? payloadWeights;
    List<String>? flickrImages;
    String? name;
    String? type;
    bool? active;
    int costPerLaunch;
    int successRatePct;
    DateTime? firstFlight;
    String? country;
    String? company;
    String? wikipedia;
    String? description;
    String? id;

    factory RocketInfoModel.fromJson(Map<String, dynamic> json) => RocketInfoModel(
        height: Diameter.fromJson(json["height"]),
        diameter: Diameter.fromJson(json["diameter"]),
        mass: Mass.fromJson(json["mass"]),
        firstStage: FirstStage.fromJson(json["first_stage"]),
        secondStage: SecondStage.fromJson(json["second_stage"]),
        engines: Engines.fromJson(json["engines"]),
        landingLegs: LandingLegs.fromJson(json["landing_legs"]),
        payloadWeights: List<PayloadWeight>.from(json["payload_weights"].map((x) => PayloadWeight.fromJson(x))),
        flickrImages: List<String>.from(json["flickr_images"].map((x) => x)),
        name: json["name"],
        type: json["type"],
        active: json["active"],
        costPerLaunch: json["cost_per_launch"],
        successRatePct: json["success_rate_pct"],
        firstFlight: DateTime.parse(json["first_flight"]),
        country: json["country"],
        company: json["company"],
        wikipedia: json["wikipedia"],
        description: json["description"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "height": height?.toJson(),
        "diameter": diameter?.toJson(),
        "mass": mass?.toJson(),
        "first_stage": firstStage?.toJson(),
        "second_stage": secondStage?.toJson(),
        "engines": engines?.toJson(),
        "landing_legs": landingLegs?.toJson(),
        "payload_weights": List<dynamic>.from(payloadWeights!.map((x) => x.toJson())),
        "flickr_images": List<dynamic>.from(flickrImages!.map((x) => x)),
        "name": name,
        "type": type,
        "active": active,
        "first_flight": "${firstFlight?.year.toString().padLeft(4, '0')}-${firstFlight?.month.toString().padLeft(2, '0')}-${firstFlight?.day.toString().padLeft(2, '0')}",
        "country": country,
        "company": company,
        "wikipedia": wikipedia,
        "description": description,
        "id": id,
    };
}

class Diameter {
    Diameter({
         this.meters,
         this.feet,
    });

    double? meters;
    double? feet;

    factory Diameter.fromJson(Map<String, dynamic> json) => Diameter(
        meters: json["meters"]?.toDouble(),
        feet: json["feet"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "meters": meters,
        "feet": feet,
    };
}

class Engines {
    Engines({
         this.isp,
         this.thrustSeaLevel,
         this.thrustVacuum,
         this.type,
         this.version,
         this.layout,
         this.propellant1,
         this.propellant2,
    });

    Isp? isp;
    Thrust? thrustSeaLevel;
    Thrust? thrustVacuum;
    String? type;
    String? version;
    String? layout;
    String? propellant1;
    String? propellant2;

    factory Engines.fromJson(Map<String, dynamic> json) => Engines(
        isp: Isp.fromJson(json["isp"]),
        thrustSeaLevel: Thrust.fromJson(json["thrust_sea_level"]),
        thrustVacuum: Thrust.fromJson(json["thrust_vacuum"]),
        type: json["type"],
        version: json["version"],
        layout: json["layout"],
        propellant1: json["propellant_1"],
        propellant2: json["propellant_2"],
    );

    Map<String, dynamic> toJson() => {
        "isp": isp?.toJson(),
        "thrust_sea_level": thrustSeaLevel?.toJson(),
        "thrust_vacuum": thrustVacuum?.toJson(),
        "type": type,
        "version": version,
        "layout": layout,
        "propellant_1": propellant1,
        "propellant_2": propellant2,
    };
}

class Isp {
    Isp({
        required this.seaLevel,
        required this.vacuum,
    });

    int seaLevel;
    int vacuum;

    factory Isp.fromJson(Map<String, dynamic> json) => Isp(
        seaLevel: json["sea_level"],
        vacuum: json["vacuum"],
    );

    Map<String, dynamic> toJson() => {
        "sea_level": seaLevel,
        "vacuum": vacuum,
    };
}

class Thrust {
    Thrust({
        required this.kN,
        required this.lbf,
    });

    int kN;
    int lbf;

    factory Thrust.fromJson(Map<String, dynamic> json) => Thrust(
        kN: json["kN"],
        lbf: json["lbf"],
    );

    Map<String, dynamic> toJson() => {
        "kN": kN,
        "lbf": lbf,
    };
}

class FirstStage {
    FirstStage({
        required this.thrustSeaLevel,
        required this.thrustVacuum,
        required this.reusable,
        required this.engines,
        required this.fuelAmountTons,
    });

    Thrust thrustSeaLevel;
    Thrust thrustVacuum;
    bool reusable;
    int engines;
    double fuelAmountTons;

    factory FirstStage.fromJson(Map<String, dynamic> json) => FirstStage(
        thrustSeaLevel: Thrust.fromJson(json["thrust_sea_level"]),
        thrustVacuum: Thrust.fromJson(json["thrust_vacuum"]),
        reusable: json["reusable"],
        engines: json["engines"],
        fuelAmountTons: json["fuel_amount_tons"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "thrust_sea_level": thrustSeaLevel.toJson(),
        "thrust_vacuum": thrustVacuum.toJson(),
        "reusable": reusable,
        "fuel_amount_tons": fuelAmountTons,
    };
}

class LandingLegs {
    LandingLegs({
        this.material,
    });

    dynamic material;

    factory LandingLegs.fromJson(Map<String, dynamic> json) => LandingLegs(
        material: json["material"],
    );

    Map<String, dynamic> toJson() => {
        "material": material,
    };
}

class Mass {
    Mass({
        required this.kg,
        required this.lb,
    });

    int kg;
    int lb;

    factory Mass.fromJson(Map<String, dynamic> json) => Mass(
        kg: json["kg"],
        lb: json["lb"],
    );

    Map<String, dynamic> toJson() => {
        "kg": kg,
        "lb": lb,
    };
}

class PayloadWeight {
    PayloadWeight({
        required this.id,
        required this.name,
        required this.kg,
        required this.lb,
    });

    String id;
    String name;
    int kg;
    int lb;

    factory PayloadWeight.fromJson(Map<String, dynamic> json) => PayloadWeight(
        id: json["id"],
        name: json["name"],
        kg: json["kg"],
        lb: json["lb"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "kg": kg,
        "lb": lb,
    };
}

class SecondStage {
    SecondStage({
        required this.thrust,
        required this.payloads,
        required this.reusable,
        required this.fuelAmountTons,
    });

    Thrust thrust;
    Payloads payloads;
    bool reusable;
    double fuelAmountTons;

    factory SecondStage.fromJson(Map<String, dynamic> json) => SecondStage(
        thrust: Thrust.fromJson(json["thrust"]),
        payloads: Payloads.fromJson(json["payloads"]),
        reusable: json["reusable"],
        fuelAmountTons: json["fuel_amount_tons"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "thrust": thrust.toJson(),
        "payloads": payloads.toJson(),
        "reusable": reusable,
        "fuel_amount_tons": fuelAmountTons,
    };
}

class Payloads {
    Payloads({
        required this.compositeFairing,
        required this.option1,
    });

    CompositeFairing compositeFairing;
    String option1;

    factory Payloads.fromJson(Map<String, dynamic> json) => Payloads(
        compositeFairing: CompositeFairing.fromJson(json["composite_fairing"]),
        option1: json["option_1"],
    );

    Map<String, dynamic> toJson() => {
        "composite_fairing": compositeFairing.toJson(),
        "option_1": option1,
    };
}

class CompositeFairing {
    CompositeFairing({
        required this.height,
        required this.diameter,
    });

    Diameter height;
    Diameter diameter;

    factory CompositeFairing.fromJson(Map<String, dynamic> json) => CompositeFairing(
        height: Diameter.fromJson(json["height"]),
        diameter: Diameter.fromJson(json["diameter"]),
    );

    Map<String, dynamic> toJson() => {
        "height": height.toJson(),
        "diameter": diameter.toJson(),
    };
}
