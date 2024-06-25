class AuthTokenApiModel {
  AuthTokenModel? response;

  AuthTokenApiModel({this.response});

  AuthTokenApiModel.fromJson(Map<String, dynamic> json) {
    response = json['response'] != null
        ? new AuthTokenModel.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.response != null) {
      data['response'] = this.response!.toJson();
    }
    return data;
  }
}

class AuthTokenModel {
  String? accessToken;
  String? tokenType;
  String? refreshToken;
  int? expiresIn;
  String? scope;
  List<dynamic>? userRole;
  String? tenantName;
  String? userType;
  String? userId;
  String? userName;
  dynamic primary;

  AuthTokenModel(
      {this.accessToken,
      this.tokenType,
      this.refreshToken,
      this.expiresIn,
      this.scope,
      this.userRole,
      this.tenantName,
      this.userType,
      this.userId,
      this.userName,
      this.primary});

  AuthTokenModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    refreshToken = json['refresh_token'];
    expiresIn = json['expires_in'];
    scope = json['scope'];
    userRole = json['user_role'];
    tenantName = json['tenant_name'];
    userType = json['user_type'];
    userId = json['user_id'];
    userName = json['user_name'];
    primary = json['primary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    data['refresh_token'] = this.refreshToken;
    data['expires_in'] = this.expiresIn;
    data['scope'] = this.scope;
    if (this.userRole != null) {
      data['user_role'] = this.userRole;
    }
    data['tenant_name'] = this.tenantName;
    data['user_type'] = this.userType;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['primary'] = this.primary;
    return data;
  }
}
