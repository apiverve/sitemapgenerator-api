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
        /// </summary>
        [JsonProperty("urls")]
        public string Urls { get; set; }

        /// <summary>
        /// Base URL to prepend to relative paths
        /// </summary>
        [JsonProperty("baseUrl")]
        public string BaseUrl { get; set; }

        /// <summary>
        /// Default change frequency
        /// </summary>
        [JsonProperty("changeFreq")]
        public string ChangeFreq { get; set; }

        /// <summary>
        /// Default priority
        /// </summary>
        [JsonProperty("priority")]
        public string Priority { get; set; }

        /// <summary>
        /// Include lastmod dates in sitemap
        /// </summary>
        [JsonProperty("includeLastMod")]
        public string IncludeLastMod { get; set; }
    }
}
