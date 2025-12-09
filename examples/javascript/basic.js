/**
 * Sitemap Generator API - Basic Usage Example
 *
 * This example demonstrates the basic usage of the Sitemap Generator API.
 * API Documentation: https://docs.apiverve.com/ref/sitemapgenerator
 */

const API_KEY = process.env.APIVERVE_API_KEY || 'YOUR_API_KEY_HERE';
const API_URL = 'https://api.apiverve.com/v1/sitemapgenerator';

/**
 * Make a POST request to the Sitemap Generator API
 */
async function callSitemapGeneratorAPI() {
  try {
    // Request body
    const requestBody &#x3D; {
    &quot;urls&quot;: [
        &quot;/&quot;,
        &quot;/about&quot;,
        &quot;/contact&quot;,
        {
            &quot;url&quot;: &quot;/blog&quot;,
            &quot;priority&quot;: 0.8,
            &quot;changeFreq&quot;: &quot;daily&quot;
        },
        {
            &quot;url&quot;: &quot;/products&quot;,
            &quot;priority&quot;: 0.9
        }
    ],
    &quot;baseUrl&quot;: &quot;https://example.com&quot;,
    &quot;changeFreq&quot;: &quot;weekly&quot;,
    &quot;priority&quot;: 0.5,
    &quot;includeLastMod&quot;: true
};

    const response = await fetch(API_URL, {
      method: 'POST',
      headers: {
        'x-api-key': API_KEY,
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(requestBody)
    });

    // Check if response is successful
    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }

    const data = await response.json();

    // Check API response status
    if (data.status === 'ok') {
      console.log('✓ Success!');
      console.log('Response data:', data.data);
      return data.data;
    } else {
      console.error('✗ API Error:', data.error || 'Unknown error');
      return null;
    }

  } catch (error) {
    console.error('✗ Request failed:', error.message);
    return null;
  }
}

// Run the example
callSitemapGeneratorAPI()
  .then(result => {
    if (result) {
      console.log('\n📊 Final Result:');
      console.log(JSON.stringify(result, null, 2));
    }
  });
