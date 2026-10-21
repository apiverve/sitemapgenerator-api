# Sitemap Generator API - Ruby Gem

Sitemap Generator is a website sitemap generator API that creates valid XML sitemaps from URL lists following the sitemaps.org protocol for search engine optimization.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_sitemapgenerator'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_sitemapgenerator
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_sitemapgenerator'

# Initialize the client
client = APIVerve::Sitemapgenerator::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({
  urls: /,/about,/contact,[object Object],[object Object],
  baseUrl: "https://example.com",
  changeFreq: "weekly",
  priority: 0.5,
  includeLastMod: true
})

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ urls: /,/about,/contact,[object Object],[object Object], baseUrl: "https://example.com", changeFreq: "weekly", priority: 0.5, includeLastMod: true })
  puts response["data"]
rescue APIVerve::Sitemapgenerator::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Sitemapgenerator::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Sitemapgenerator::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
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

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/sitemapgenerator?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/sitemapgenerator?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/sitemapgenerator?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).
