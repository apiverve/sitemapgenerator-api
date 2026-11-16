import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models.dart';

/// Validation rule for a parameter.
class ValidationRule {
  final String type;
  final bool required;
  final num? min;
  final num? max;
  final int? minLength;
  final int? maxLength;
  final String? format;
  final List<String>? enumValues;

  const ValidationRule({
    required this.type,
    required this.required,
    this.min,
    this.max,
    this.minLength,
    this.maxLength,
    this.format,
    this.enumValues,
  });
}

/// Exception thrown when parameter validation fails.
class SitemapgeneratorValidationException implements Exception {
  final List<String> errors;

  SitemapgeneratorValidationException(this.errors);

  @override
  String toString() => 'SitemapgeneratorValidationException: ${errors.join("; ")}';
}

/// Format validation patterns.
final _formatPatterns = {
  'email': RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$'),
  'url': RegExp(r'^https?://.+'),
  'ip': RegExp(r'^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$|^([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}$'),
  'date': RegExp(r'^\d{4}-\d{2}-\d{2}$'),
  'hexColor': RegExp(r'^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$'),
};

/// Sitemap Generator API client.
///
/// For more information, visit: https://apiverve.com/marketplace/sitemapgenerator?utm_source=dart&utm_medium=referral&utm_content=readme
///
/// Parameters:
/// * [urls] (required) - Array of URLs (strings or objects with url, priority, changeFreq, lastMod)
/// * [baseUrl] - Base URL to prepend to relative paths [format: url]
/// * [changeFreq] - Default change frequency
/// * [priority] - Default priority [min: 0, max: 1]
/// * [includeLastMod] - Include lastmod dates in sitemap
class SitemapgeneratorClient {
  final String apiKey;
  final String baseUrl;
  final http.Client _httpClient;

  /// Validation rules for parameters.
  static final Map<String, ValidationRule> _validationRules = <String, ValidationRule>{
    'urls': ValidationRule(type: 'array', required: true),
    'baseUrl': ValidationRule(type: 'string', required: false, format: 'url'),
    'changeFreq': ValidationRule(type: 'string', required: false),
    'priority': ValidationRule(type: 'number', required: false, min: 0, max: 1),
    'includeLastMod': ValidationRule(type: 'boolean', required: false),
  };

  SitemapgeneratorClient(this.apiKey, {
    this.baseUrl = 'https://api.apiverve.com/v1/sitemapgenerator',
    http.Client? httpClient,
  }) : _httpClient = httpClient ?? http.Client();

  /// Validates parameters against defined rules.
  /// Throws [SitemapgeneratorValidationException] if validation fails.
  void _validateParams(Map<String, dynamic> params) {
    final errors = <String>[];

    for (final entry in _validationRules.entries) {
      final paramName = entry.key;
      final rule = entry.value;
      final value = params[paramName];

      // Check required
      if (rule.required && (value == null || (value is String && value.isEmpty))) {
        errors.add('Required parameter [$paramName] is missing');
        continue;
      }

      if (value == null) continue;

      // Type-specific validation
      if (rule.type == 'integer' || rule.type == 'number') {
        final numValue = value is num ? value : num.tryParse(value.toString());
        if (numValue == null) {
          errors.add('Parameter [$paramName] must be a valid ${rule.type}');
          continue;
        }
        if (rule.min != null && numValue < rule.min!) {
          errors.add('Parameter [$paramName] must be at least ${rule.min}');
        }
        if (rule.max != null && numValue > rule.max!) {
          errors.add('Parameter [$paramName] must be at most ${rule.max}');
        }
      } else if (rule.type == 'string' && value is String) {
        if (rule.minLength != null && value.length < rule.minLength!) {
          errors.add('Parameter [$paramName] must be at least ${rule.minLength} characters');
        }
        if (rule.maxLength != null && value.length > rule.maxLength!) {
          errors.add('Parameter [$paramName] must be at most ${rule.maxLength} characters');
        }
        if (rule.format != null && _formatPatterns.containsKey(rule.format)) {
          if (!_formatPatterns[rule.format]!.hasMatch(value)) {
            errors.add('Parameter [$paramName] must be a valid ${rule.format}');
          }
        }
      }

      // Enum validation
      if (rule.enumValues != null && rule.enumValues!.isNotEmpty) {
        if (!rule.enumValues!.contains(value.toString())) {
          errors.add('Parameter [$paramName] must be one of: ${rule.enumValues!.join(", ")}');
        }
      }
    }

    if (errors.isNotEmpty) {
      throw SitemapgeneratorValidationException(errors);
    }
  }

  /// Execute a request to the Sitemap Generator API.
  ///
  /// Parameters are validated before sending the request.
  Future<SitemapgeneratorResponse> execute(Map<String, dynamic> params) async {
    // Validate parameters
    _validateParams(params);
    if (apiKey.isEmpty) {
      throw SitemapgeneratorException('API key is required. Get your API key at: https://apiverve.com');
    }

    try {
      final response = await _httpClient.post(
        Uri.parse(baseUrl),
        headers: {
          'x-api-key': apiKey,
          'Content-Type': 'application/json',
        },
        body: jsonEncode(params),
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        return SitemapgeneratorResponse.fromJson(json);
      } else if (response.statusCode == 401) {
        throw SitemapgeneratorException('Invalid API key');
      } else if (response.statusCode == 404) {
        throw SitemapgeneratorException('Resource not found');
      } else {
        throw SitemapgeneratorException('API error: ${response.statusCode}');
      }
    } catch (e) {
      if (e is SitemapgeneratorException) rethrow;
      throw SitemapgeneratorException('Request failed: $e');
    }
  }


  /// Close the HTTP client.
  void close() {
    _httpClient.close();
  }
}

/// Exception thrown by the Sitemap Generator API client.
class SitemapgeneratorException implements Exception {
  final String message;

  SitemapgeneratorException(this.message);

  @override
  String toString() => 'SitemapgeneratorException: $message';
}
