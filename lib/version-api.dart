class VersionAPI {
  final int version;
  VersionAPI({ this.version });

  factory VersionAPI.fromJson(Map<String, dynamic> json) {
    return VersionAPI(
      version: json['version']
    );
  }
}
