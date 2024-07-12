class ForceUpdate {
  String version;
  int build;
  String description;
  bool forceLogout = false;

  ForceUpdate({required this.version, required this.build, required this.description, this.forceLogout = false});

  bool shouldUpdate(String appVersion) {
    int appBuildNumber = int.tryParse(appVersion.split('+')[1]) ?? 0;
    return build > appBuildNumber;
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'version': version,
      'build': build,
      'description': description,
      'force_logout': forceLogout,
    };
  }

  factory ForceUpdate.fromJson(Map<String, dynamic> json) {
    return ForceUpdate(
        version: json['version'],
        build: json['build'] as int,
        description: json['description'],
        forceLogout: json['force_logout']);
  }
}

// Sample
// {
//   "version": "1.0.0",
//   "build": 1,
//   "description": "A new version is available",
//   "force_logout": false
// }