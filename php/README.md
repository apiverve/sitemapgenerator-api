# Sitemap Generator API - PHP Package

Sitemap Generator is a website sitemap generator API that creates valid XML sitemaps from URL lists following the sitemaps.org protocol for search engine optimization.

## Installation

Install via Composer:

```bash
composer require apiverve/sitemapgenerator
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Sitemapgenerator\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute([
    'urls' => /,/about,/contact,[object Object],[object Object],
    'baseUrl' => 'https://example.com',
    'changeFreq' => 'weekly',
    'priority' => 0.5,
    'includeLastMod' => true
]);

// Print the response
print_r($response);
```


### Error Handling

```php
use APIVerve\Sitemapgenerator\Client;
use APIVerve\Sitemapgenerator\Exceptions\APIException;
use APIVerve\Sitemapgenerator\Exceptions\ValidationException;

try {
    $response = $client->execute(['urls' => /,/about,/contact,[object Object],[object Object], 'baseUrl' => 'https://example.com', 'changeFreq' => 'weekly', 'priority' => 0.5, 'includeLastMod' => true]);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
```

## Example Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "sitemap": "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\">\n  <url>\n    <loc>https://example.com/</loc>\n    <lastmod>2025-12-16</lastmod>\n    <changefreq>weekly</changefreq>\n    <priority>0.5</priority>\n  </url>\n  <url>\n    <loc>https://example.com/about</loc>\n    <lastmod>2025-12-16</lastmod>\n    <changefreq>weekly</changefreq>\n    <priority>0.5</priority>\n  </url>\n  <url>\n    <loc>https://example.com/contact</loc>\n    <lastmod>2025-12-16</lastmod>\n    <changefreq>weekly</changefreq>\n    <priority>0.5</priority>\n  </url>\n  <url>\n    <loc>https://example.com/blog</loc>\n    <lastmod>2025-12-16</lastmod>\n    <changefreq>daily</changefreq>\n    <priority>0.8</priority>\n  </url>\n  <url>\n    <loc>https://example.com/products</loc>\n    <lastmod>2025-12-16</lastmod>\n    <changefreq>weekly</changefreq>\n    <priority>0.9</priority>\n  </url>\n</urlset>",
    "urlCount": 5,
    "sizeBytes": 892,
    "sizeKb": 0.87,
    "format": "XML",
    "protocol": "sitemaps.org/0.9",
    "settings": {
      "defaultChangeFreq": "weekly",
      "defaultPriority": 0.5,
      "includeLastMod": true,
      "baseUrl": "https://example.com"
    }
  }
}
```

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/sitemapgenerator?utm_source=packagist&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/sitemapgenerator?utm_source=php&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/sitemapgenerator?utm_source=php&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
