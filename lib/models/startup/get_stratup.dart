class AllStratupModel {
  bool? success;
  String? message;
  List<StartupData>? data;

  AllStratupModel({this.success, this.message, this.data});

  AllStratupModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <StartupData>[];
      json['data'].forEach((v) {
        data!.add(StartupData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StartupData {
  String? id;
  String? serviceName;
  String? serviceType;
  String? imgUrl;
  String? description;
  String? price;
  String? gst;
  List<Documents>? documents;
  String? createdAt;
  String? updatedAt;

  StartupData(
      {this.id,
        this.serviceName,
        this.serviceType,
        this.imgUrl,
        this.description,
        this.price,
        this.gst,
        this.documents,
        this.createdAt,
        this.updatedAt});

  StartupData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serviceName = json['serviceName'];
    serviceType = json['serviceType'];
    imgUrl = json['imgUrl'];
    description = json['description'];
    price = json['price'];
    gst = json['gst'];
    if (json['documents'] != null) {
      documents = <Documents>[];
      json['documents'].forEach((v) {
        documents!.add(Documents.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['serviceName'] = serviceName;
    data['serviceType'] = serviceType;
    data['imgUrl'] = imgUrl;
    data['description'] = description;
    data['price'] = price;
    data['gst'] = gst;
    if (documents != null) {
      data['documents'] = documents!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class Documents {
  String? title;
  String? shortName;
  String? type;
  String? numInputs;

  Documents({this.title, this.shortName, this.type, this.numInputs});

  Documents.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    shortName = json['shortName'];
    type = json['type'];
    numInputs = json['numInputs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['shortName'] = shortName;
    data['type'] = type;
    data['numInputs'] = numInputs;
    return data;
  }
}

