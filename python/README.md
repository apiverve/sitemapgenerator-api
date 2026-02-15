Sitemap Generator API
============

Sitemap Generator creates valid XML sitemaps from URL lists following the sitemaps.org protocol for search engine optimization.

![Build Status](https://img.shields.io/badge/build-passing-green)
![Code Climate](https://img.shields.io/badge/maintainability-B-purple)
![Prod Ready](https://img.shields.io/badge/production-ready-blue)

This is a Python API Wrapper for the [Sitemap Generator API](https://apiverve.com/marketplace/sitemapgenerator?utm_source=pypi&utm_medium=readme)

---

## Installation

Using `pip`:

```bash
pip install apiverve-sitemapgenerator
```

Using `pip3`:

```bash
pip3 install apiverve-sitemapgenerator
```

---

## Configuration

Before using the sitemapgenerator API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=pypi&utm_medium=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```python
from apiverve_sitemapgenerator.apiClient import SitemapgeneratorAPIClient

# Initialize the client with your APIVerve API key
api = SitemapgeneratorAPIClient("[YOUR_API_KEY]")

query = { "urls": [ "/", "/about", "/contact", { "url": "/blog", "priority": 0.8, "changeFreq": "daily" }, { "url": "/products", "priority": 0.9 } ], "baseUrl": "https://example.com", "changeFreq": "weekly", "priority": 0.5, "includeLastMod": true }

try:
    # Make the API call
    result = api.execute(query)

    # Print the result
    print(result)
except Exception as e:
    print(f"Error: {e}")
```

---

## Usage

The Sitemap Generator API documentation is found here: [https://docs.apiverve.com/ref/sitemapgenerator](https://docs.apiverve.com/ref/sitemapgenerator?utm_source=pypi&utm_medium=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```python
# Import the client module
from apiverve_sitemapgenerator.apiClient import SitemapgeneratorAPIClient

# Initialize the client with your APIVerve API key
api = SitemapgeneratorAPIClient("[YOUR_API_KEY]")
```

---

## Perform Request

Using the API client, you can perform requests to the API.

###### Define Query

```python
query = { "urls": [ "/", "/about", "/contact", { "url": "/blog", "priority": 0.8, "changeFreq": "daily" }, { "url": "/products", "priority": 0.9 } ], "baseUrl": "https://example.com", "changeFreq": "weekly", "priority": 0.5, "includeLastMod": true }
```

###### Simple Request

```python
# Make a request to the API
result = api.execute(query)

# Print the result
print(result)
```

###### Example Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "sitemap": "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\">\n  <url>\n    <loc>https://example.com/</loc>\n    <lastmod>2025-12-02</lastmod>\n    <changefreq>weekly</changefreq>\n    <priority>0.5</priority>\n  </url>\n  <url>\n    <loc>https://example.com/about</loc>\n    <lastmod>2025-12-02</lastmod>\n    <changefreq>weekly</changefreq>\n    <priority>0.5</priority>\n  </url>\n  <url>\n    <loc>https://example.com/contact</loc>\n    <lastmod>2025-12-02</lastmod>\n    <changefreq>weekly</changefreq>\n    <priority>0.5</priority>\n  </url>\n  <url>\n    <loc>https://example.com/blog</loc>\n    <lastmod>2025-12-02</lastmod>\n    <changefreq>daily</changefreq>\n    <priority>0.8</priority>\n  </url>\n  <url>\n    <loc>https://example.com/products</loc>\n    <lastmod>2025-12-02</lastmod>\n    <changefreq>weekly</changefreq>\n    <priority>0.9</priority>\n  </url>\n</urlset>",
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

---

## Error Handling

The API client provides comprehensive error handling through the `SitemapgeneratorAPIClientError` exception. Here are some examples:

### Basic Error Handling

```python
from apiverve_sitemapgenerator.apiClient import SitemapgeneratorAPIClient, SitemapgeneratorAPIClientError

api = SitemapgeneratorAPIClient("[YOUR_API_KEY]")

query = { "urls": [ "/", "/about", "/contact", { "url": "/blog", "priority": 0.8, "changeFreq": "daily" }, { "url": "/products", "priority": 0.9 } ], "baseUrl": "https://example.com", "changeFreq": "weekly", "priority": 0.5, "includeLastMod": true }

try:
    result = api.execute(query)
    print("Success!")
    print(result)
except SitemapgeneratorAPIClientError as e:
    print(f"API Error: {e.message}")
    if e.status_code:
        print(f"Status Code: {e.status_code}")
    if e.response:
        print(f"Response: {e.response}")
```

### Handling Specific Error Types

```python
from apiverve_sitemapgenerator.apiClient import SitemapgeneratorAPIClient, SitemapgeneratorAPIClientError

api = SitemapgeneratorAPIClient("[YOUR_API_KEY]")

query = { "urls": [ "/", "/about", "/contact", { "url": "/blog", "priority": 0.8, "changeFreq": "daily" }, { "url": "/products", "priority": 0.9 } ], "baseUrl": "https://example.com", "changeFreq": "weekly", "priority": 0.5, "includeLastMod": true }

try:
    result = api.execute(query)

    # Check for successful response
    if result.get('status') == 'success':
        print("Request successful!")
        print(result.get('data'))
    else:
        print(f"API returned an error: {result.get('error')}")

except SitemapgeneratorAPIClientError as e:
    # Handle API client errors
    if e.status_code == 401:
        print("Unauthorized: Invalid API key")
    elif e.status_code == 429:
        print("Rate limit exceeded")
    elif e.status_code >= 500:
        print("Server error - please try again later")
    else:
        print(f"API error: {e.message}")
except Exception as e:
    # Handle unexpected errors
    print(f"Unexpected error: {str(e)}")
```

### Using Context Manager (Recommended)

The client supports the context manager protocol for automatic resource cleanup:

```python
from apiverve_sitemapgenerator.apiClient import SitemapgeneratorAPIClient, SitemapgeneratorAPIClientError

query = { "urls": [ "/", "/about", "/contact", { "url": "/blog", "priority": 0.8, "changeFreq": "daily" }, { "url": "/products", "priority": 0.9 } ], "baseUrl": "https://example.com", "changeFreq": "weekly", "priority": 0.5, "includeLastMod": true }

# Using context manager ensures proper cleanup
with SitemapgeneratorAPIClient("[YOUR_API_KEY]") as api:
    try:
        result = api.execute(query)
        print(result)
    except SitemapgeneratorAPIClientError as e:
        print(f"Error: {e.message}")
# Session is automatically closed here
```

---

## Advanced Features

### Debug Mode

Enable debug logging to see detailed request and response information:

```python
from apiverve_sitemapgenerator.apiClient import SitemapgeneratorAPIClient

# Enable debug mode
api = SitemapgeneratorAPIClient("[YOUR_API_KEY]", debug=True)

query = { "urls": [ "/", "/about", "/contact", { "url": "/blog", "priority": 0.8, "changeFreq": "daily" }, { "url": "/products", "priority": 0.9 } ], "baseUrl": "https://example.com", "changeFreq": "weekly", "priority": 0.5, "includeLastMod": true }

# Debug information will be printed to console
result = api.execute(query)
```

### Manual Session Management

If you need to manually manage the session lifecycle:

```python
from apiverve_sitemapgenerator.apiClient import SitemapgeneratorAPIClient

api = SitemapgeneratorAPIClient("[YOUR_API_KEY]")

try:
    query = { "urls": [ "/", "/about", "/contact", { "url": "/blog", "priority": 0.8, "changeFreq": "daily" }, { "url": "/products", "priority": 0.9 } ], "baseUrl": "https://example.com", "changeFreq": "weekly", "priority": 0.5, "includeLastMod": true }
    result = api.execute(query)
    print(result)
finally:
    # Manually close the session when done
    api.close()
```

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=pypi&utm_medium=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=pypi&utm_medium=readme) and all legal documents and agreements.

---

## License
Licensed under the The MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
