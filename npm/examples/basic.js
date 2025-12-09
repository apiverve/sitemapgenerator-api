/**
 * Basic Example - Sitemap Generator API
 *
 * This example demonstrates how to use the Sitemap Generator API.
 * Make sure to set your API key in the .env file or replace '[YOUR_API_KEY]' below.
 */

require('dotenv').config();
const sitemapgeneratorAPI = require('../index.js');

// Initialize the API client
const api = new sitemapgeneratorAPI({
    api_key: process.env.API_KEY || '[YOUR_API_KEY]'
});

// Example query
var query = {
  "urls": [
    "/",
    "/about",
    "/contact",
    {
      "url": "/blog",
      "priority": 0.8,
      "changeFreq": "daily"
    },
    {
      "url": "/products",
      "priority": 0.9
    }
  ],
  "baseUrl": "https://example.com",
  "changeFreq": "weekly",
  "priority": 0.5,
  "includeLastMod": true
};

// Make the API request using callback
console.log('Making request to Sitemap Generator API...\n');

api.execute(query, function (error, data) {
    if (error) {
        console.error('Error occurred:');
        if (error.error) {
            console.error('Message:', error.error);
            console.error('Status:', error.status);
        } else {
            console.error(JSON.stringify(error, null, 2));
        }
        return;
    }

    console.log('Response:');
    console.log(JSON.stringify(data, null, 2));
});
