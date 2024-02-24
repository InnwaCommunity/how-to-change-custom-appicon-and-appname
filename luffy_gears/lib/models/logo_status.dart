

class LogoStatus {
  String? logoName;
  String? logoAssets;
  String? methodName;
  bool? isSet;
  LogoStatus(
      { this.logoName,
        this.logoAssets,
        this.methodName,
        this.isSet});

  LogoStatus.fromJson(Map<String,dynamic> json){
    logoName = json['LogoName'];
    logoAssets = json['LogoAssets'];
    methodName = json['MethodName'];
    isSet = json['IsSet'];
  }

    Map<String,dynamic> toJson( ){
    final Map<String ,dynamic> data= <String,dynamic>{};
    data['LogoName'] = logoName;
    data['LogoAssets'] = logoAssets;
    data['MethodName'] = methodName;
    data['IsSet'] = isSet;
    return data;
  }

}
