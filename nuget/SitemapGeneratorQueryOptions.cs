using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.SitemapGenerator
{
    /// <summary>
    /// Query options for the Sitemap Generator API
    /// </summary>
    public class SitemapGeneratorQueryOptions
    {
        /// <summary>
        /// Array of URLs (strings or objects with url, priority, changeFreq, lastMod)
        /// Example: ["/about", "/contact", {"url": "/blog", "priority": 0.8}]
        /// </summary>
        [JsonProperty("urls")]
        public string Urls { get; set; }

        /// <summary>
        /// Base URL to prepend to relative paths
        /// Example: https://example.com
        /// </summary>
        [JsonProperty("baseUrl")]
        public string BaseUrl { get; set; }

        /// <summary>
        /// Default change frequency: always, hourly, daily, weekly, monthly, yearly, never
        /// Example: weekly
        /// </summary>
        [JsonProperty("changeFreq")]
        public string ChangeFreq { get; set; }

        /// <summary>
        /// Default priority (0.0 to 1.0)
        /// Example: 0.5
        /// </summary>
        [JsonProperty("priority")]
        public string Priority { get; set; }

        /// <summary>
        /// Include lastmod dates in sitemap
        /// Example: true
        /// </summary>
        [JsonProperty("includeLastMod")]
        public string IncludeLastMod { get; set; }
    }
}
