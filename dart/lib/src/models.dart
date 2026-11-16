/// Response models for the Sitemap Generator API.

/// API Response wrapper.
class SitemapgeneratorResponse {
  final String status;
  final dynamic error;
  final SitemapgeneratorData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  SitemapgeneratorResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory SitemapgeneratorResponse.fromJson(Map<String, dynamic> json) => SitemapgeneratorResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? SitemapgeneratorData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the Sitemap Generator API.

class SitemapgeneratorData {
  String? sitemap;
  num? urlCount;
  num? sizeBytes;
  num? sizeKb;
  String? format;
  String? protocol;
  SitemapgeneratorDataSettings? settings;

  SitemapgeneratorData({
    this.sitemap,
    this.urlCount,
    this.sizeBytes,
    this.sizeKb,
    this.format,
    this.protocol,
    this.settings,
  });

  factory SitemapgeneratorData.fromJson(Map<String, dynamic> json) => SitemapgeneratorData(
      sitemap: json['sitemap'],
      urlCount: json['urlCount'],
      sizeBytes: json['sizeBytes'],
      sizeKb: json['sizeKb'],
      format: json['format'],
      protocol: json['protocol'],
      settings: json['settings'] != null ? SitemapgeneratorDataSettings.fromJson(json['settings']) : null,
    );
}

class SitemapgeneratorDataSettings {
  String? defaultChangeFreq;
  num? defaultPriority;
  bool? includeLastMod;
  String? baseUrl;

  SitemapgeneratorDataSettings({
    this.defaultChangeFreq,
    this.defaultPriority,
    this.includeLastMod,
    this.baseUrl,
  });

  factory SitemapgeneratorDataSettings.fromJson(Map<String, dynamic> json) => SitemapgeneratorDataSettings(
      defaultChangeFreq: json['defaultChangeFreq'],
      defaultPriority: json['defaultPriority'],
      includeLastMod: json['includeLastMod'],
      baseUrl: json['baseUrl'],
    );
}

class SitemapgeneratorRequest {
  List<String> urls;
  String? baseUrl;
  String? changeFreq;
  num? priority;
  bool? includeLastMod;

  SitemapgeneratorRequest({
    required this.urls,
    this.baseUrl,
    this.changeFreq,
    this.priority,
    this.includeLastMod,
  });

  Map<String, dynamic> toJson() => {
      'urls': urls,
      if (baseUrl != null) 'baseUrl': baseUrl,
      if (changeFreq != null) 'changeFreq': changeFreq,
      if (priority != null) 'priority': priority,
      if (includeLastMod != null) 'includeLastMod': includeLastMod,
    };
}
