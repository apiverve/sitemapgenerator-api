Sitemap Generator API
============

Sitemap Generator creates valid XML sitemaps from URL lists following the sitemaps.org protocol for search engine optimization.

![Build Status](https://img.shields.io/badge/build-passing-green)
![Code Climate](https://img.shields.io/badge/maintainability-B-purple)
![Prod Ready](https://img.shields.io/badge/production-ready-blue)

This is a Python API Wrapper for the [Sitemap Generator API](https://apiverve.com/marketplace/api/sitemapgenerator)

---

## Installation
	pip install apiverve-sitemapgenerator

---

## Configuration

Before using the sitemapgenerator API client, you have to setup your account and obtain your API Key.  
You can get it by signing up at [https://apiverve.com](https://apiverve.com)

---

## Usage

The Sitemap Generator API documentation is found here: [https://docs.apiverve.com/api/sitemapgenerator](https://docs.apiverve.com/api/sitemapgenerator).  
You can find parameters, example responses, and status codes documented here.

### Setup

```
# Import the client module
from apiverve_sitemapgenerator.apiClient import SitemapgeneratorAPIClient

# Initialize the client with your APIVerve API key
api = SitemapgeneratorAPIClient("[YOUR_API_KEY]")
```

---


### Perform Request
Using the API client, you can perform requests to the API.

###### Define Query

```
query = { "urls": [ "/", "/about", "/contact", { "url": "/blog", "priority": 0.8, "changeFreq": "daily" }, { "url": "/products", "priority": 0.9 } ], "baseUrl": "https://example.com", "changeFreq": "weekly", "priority": 0.5, "includeLastMod": true }
```

###### Simple Request

```
# Make a request to the API
result = api.execute(query)

# Print the result
print(result)
```

###### Example Response

```
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

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms) and all legal documents and agreements.

---

## License
Licensed under the The MIT License (MIT)

Copyright (&copy;) 2025 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.