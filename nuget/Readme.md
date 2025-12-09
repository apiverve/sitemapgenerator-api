APIVerve.API.SitemapGenerator API
============

Sitemap Generator creates valid XML sitemaps from URL lists following the sitemaps.org protocol for search engine optimization.

![Build Status](https://img.shields.io/badge/build-passing-green)
![Code Climate](https://img.shields.io/badge/maintainability-B-purple)
![Prod Ready](https://img.shields.io/badge/production-ready-blue)

This is a .NET Wrapper for the [APIVerve.API.SitemapGenerator API](https://apiverve.com/marketplace/sitemapgenerator)

---

## Installation

Using the .NET CLI:
```
dotnet add package APIVerve.API.SitemapGenerator
```

Using the Package Manager:
```
nuget install APIVerve.API.SitemapGenerator
```

Using the Package Manager Console:
```
Install-Package APIVerve.API.SitemapGenerator
```

From within Visual Studio:

1. Open the Solution Explorer
2. Right-click on a project within your solution
3. Click on Manage NuGet Packages
4. Click on the Browse tab and search for "APIVerve.API.SitemapGenerator"
5. Click on the APIVerve.API.SitemapGenerator package, select the appropriate version in the right-tab and click Install

---

## Configuration

Before using the sitemapgenerator API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com)

---

## Quick Start

Here's a simple example to get you started quickly:

```csharp
using System;
using APIVerve;

class Program
{
    static async Task Main(string[] args)
    {
        // Initialize the API client
        var apiClient = new SitemapGeneratorAPIClient("[YOUR_API_KEY]");

        var queryOptions = new SitemapGeneratorQueryOptions {
  urls = [
    "/",
    "/about",
    "/contact",
    {
      url = "/blog",
      priority = 0.8,
      changeFreq = "daily"
    },
    {
      url = "/products",
      priority = 0.9
    }
  ],
  baseUrl = "https://example.com",
  changeFreq = "weekly",
  priority = 0.5,
  includeLastMod = true
};

        // Make the API call
        try
        {
            var response = await apiClient.ExecuteAsync(queryOptions);

            if (response.Error != null)
            {
                Console.WriteLine($"API Error: {response.Error}");
            }
            else
            {
                Console.WriteLine("Success!");
                // Access response data using the strongly-typed ResponseObj properties
                Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Exception: {ex.Message}");
        }
    }
}
```

---

## Usage

The APIVerve.API.SitemapGenerator API documentation is found here: [https://docs.apiverve.com/ref/sitemapgenerator](https://docs.apiverve.com/ref/sitemapgenerator).
You can find parameters, example responses, and status codes documented here.

### Setup

###### Authentication
APIVerve.API.SitemapGenerator API uses API Key-based authentication. When you create an instance of the API client, you can pass your API Key as a parameter.

```csharp
// Create an instance of the API client
var apiClient = new SitemapGeneratorAPIClient("[YOUR_API_KEY]");
```

---

## Usage Examples

### Basic Usage (Async/Await Pattern - Recommended)

The modern async/await pattern provides the best performance and code readability:

```csharp
using System;
using System.Threading.Tasks;
using APIVerve;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new SitemapGeneratorAPIClient("[YOUR_API_KEY]");

        var queryOptions = new SitemapGeneratorQueryOptions {
  urls = [
    "/",
    "/about",
    "/contact",
    {
      url = "/blog",
      priority = 0.8,
      changeFreq = "daily"
    },
    {
      url = "/products",
      priority = 0.9
    }
  ],
  baseUrl = "https://example.com",
  changeFreq = "weekly",
  priority = 0.5,
  includeLastMod = true
};

        var response = await apiClient.ExecuteAsync(queryOptions);

        if (response.Error != null)
        {
            Console.WriteLine($"Error: {response.Error}");
        }
        else
        {
            Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
        }
    }
}
```

### Synchronous Usage

If you need to use synchronous code, you can use the `Execute` method:

```csharp
using System;
using APIVerve;

public class Example
{
    public static void Main(string[] args)
    {
        var apiClient = new SitemapGeneratorAPIClient("[YOUR_API_KEY]");

        var queryOptions = new SitemapGeneratorQueryOptions {
  urls = [
    "/",
    "/about",
    "/contact",
    {
      url = "/blog",
      priority = 0.8,
      changeFreq = "daily"
    },
    {
      url = "/products",
      priority = 0.9
    }
  ],
  baseUrl = "https://example.com",
  changeFreq = "weekly",
  priority = 0.5,
  includeLastMod = true
};

        var response = apiClient.Execute(queryOptions);

        if (response.Error != null)
        {
            Console.WriteLine($"Error: {response.Error}");
        }
        else
        {
            Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
        }
    }
}
```

---

## Error Handling

The API client provides comprehensive error handling. Here are some examples:

### Handling API Errors

```csharp
using System;
using System.Threading.Tasks;
using APIVerve;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new SitemapGeneratorAPIClient("[YOUR_API_KEY]");

        var queryOptions = new SitemapGeneratorQueryOptions {
  urls = [
    "/",
    "/about",
    "/contact",
    {
      url = "/blog",
      priority = 0.8,
      changeFreq = "daily"
    },
    {
      url = "/products",
      priority = 0.9
    }
  ],
  baseUrl = "https://example.com",
  changeFreq = "weekly",
  priority = 0.5,
  includeLastMod = true
};

        try
        {
            var response = await apiClient.ExecuteAsync(queryOptions);

            // Check for API-level errors
            if (response.Error != null)
            {
                Console.WriteLine($"API Error: {response.Error}");
                Console.WriteLine($"Status: {response.Status}");
                return;
            }

            // Success - use the data
            Console.WriteLine("Request successful!");
            Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
        }
        catch (ArgumentException ex)
        {
            // Invalid API key or parameters
            Console.WriteLine($"Invalid argument: {ex.Message}");
        }
        catch (System.Net.Http.HttpRequestException ex)
        {
            // Network or HTTP errors
            Console.WriteLine($"Network error: {ex.Message}");
        }
        catch (Exception ex)
        {
            // Other errors
            Console.WriteLine($"Unexpected error: {ex.Message}");
        }
    }
}
```

### Comprehensive Error Handling with Retry Logic

```csharp
using System;
using System.Threading.Tasks;
using APIVerve;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new SitemapGeneratorAPIClient("[YOUR_API_KEY]");

        // Configure retry behavior (max 3 retries)
        apiClient.SetMaxRetries(3);        // Retry up to 3 times (default: 0, max: 3)
        apiClient.SetRetryDelay(2000);     // Wait 2 seconds between retries

        var queryOptions = new SitemapGeneratorQueryOptions {
  urls = [
    "/",
    "/about",
    "/contact",
    {
      url = "/blog",
      priority = 0.8,
      changeFreq = "daily"
    },
    {
      url = "/products",
      priority = 0.9
    }
  ],
  baseUrl = "https://example.com",
  changeFreq = "weekly",
  priority = 0.5,
  includeLastMod = true
};

        try
        {
            var response = await apiClient.ExecuteAsync(queryOptions);

            if (response.Error != null)
            {
                Console.WriteLine($"API Error: {response.Error}");
            }
            else
            {
                Console.WriteLine("Success!");
                Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Failed after retries: {ex.Message}");
        }
    }
}
```

---

## Advanced Features

### Custom Headers

Add custom headers to your requests:

```csharp
var apiClient = new SitemapGeneratorAPIClient("[YOUR_API_KEY]");

// Add custom headers
apiClient.AddCustomHeader("X-Custom-Header", "custom-value");
apiClient.AddCustomHeader("X-Request-ID", Guid.NewGuid().ToString());

var queryOptions = new SitemapGeneratorQueryOptions {
  urls = [
    "/",
    "/about",
    "/contact",
    {
      url = "/blog",
      priority = 0.8,
      changeFreq = "daily"
    },
    {
      url = "/products",
      priority = 0.9
    }
  ],
  baseUrl = "https://example.com",
  changeFreq = "weekly",
  priority = 0.5,
  includeLastMod = true
};

var response = await apiClient.ExecuteAsync(queryOptions);

// Remove a header
apiClient.RemoveCustomHeader("X-Custom-Header");

// Clear all custom headers
apiClient.ClearCustomHeaders();
```

### Request Logging

Enable logging for debugging:

```csharp
var apiClient = new SitemapGeneratorAPIClient("[YOUR_API_KEY]", isDebug: true);

// Or use a custom logger
apiClient.SetLogger(message =>
{
    Console.WriteLine($"[LOG] {DateTime.Now:yyyy-MM-dd HH:mm:ss} - {message}");
});

var queryOptions = new SitemapGeneratorQueryOptions {
  urls = [
    "/",
    "/about",
    "/contact",
    {
      url = "/blog",
      priority = 0.8,
      changeFreq = "daily"
    },
    {
      url = "/products",
      priority = 0.9
    }
  ],
  baseUrl = "https://example.com",
  changeFreq = "weekly",
  priority = 0.5,
  includeLastMod = true
};

var response = await apiClient.ExecuteAsync(queryOptions);
```

### Retry Configuration

Customize retry behavior for failed requests:

```csharp
var apiClient = new SitemapGeneratorAPIClient("[YOUR_API_KEY]");

// Set retry options
apiClient.SetMaxRetries(3);           // Retry up to 3 times (default: 0, max: 3)
apiClient.SetRetryDelay(1500);        // Wait 1.5 seconds between retries (default: 1000ms)

var queryOptions = new SitemapGeneratorQueryOptions {
  urls = [
    "/",
    "/about",
    "/contact",
    {
      url = "/blog",
      priority = 0.8,
      changeFreq = "daily"
    },
    {
      url = "/products",
      priority = 0.9
    }
  ],
  baseUrl = "https://example.com",
  changeFreq = "weekly",
  priority = 0.5,
  includeLastMod = true
};

var response = await apiClient.ExecuteAsync(queryOptions);
```

### Dispose Pattern

The API client implements `IDisposable` for proper resource cleanup:

```csharp
using (var apiClient = new SitemapGeneratorAPIClient("[YOUR_API_KEY]"))
{
    var queryOptions = new SitemapGeneratorQueryOptions {
  urls = [
    "/",
    "/about",
    "/contact",
    {
      url = "/blog",
      priority = 0.8,
      changeFreq = "daily"
    },
    {
      url = "/products",
      priority = 0.9
    }
  ],
  baseUrl = "https://example.com",
  changeFreq = "weekly",
  priority = 0.5,
  includeLastMod = true
};
    var response = await apiClient.ExecuteAsync(queryOptions);
    Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
}
// HttpClient is automatically disposed here
```

---

## Example Response

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
