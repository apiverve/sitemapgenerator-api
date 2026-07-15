"""
Sitemap Generator API - Basic Usage Example

This example demonstrates the basic usage of the Sitemap Generator API.
API Documentation: https://docs.apiverve.com/ref/sitemapgenerator
"""

import os
import requests
import json

API_KEY = os.getenv('APIVERVE_API_KEY', 'YOUR_API_KEY_HERE')
API_URL = 'https://api.apiverve.com/v1/sitemapgenerator'

def call_sitemapgenerator_api():
    """
    Make a POST request to the Sitemap Generator API
    """
    try:
        # Request body
        request_body &#x3D; {
    &#x27;urls&#x27;: [
        &#x27;/&#x27;,
        &#x27;/about&#x27;,
        &#x27;/contact&#x27;,
        {
            &#x27;url&#x27;: &#x27;/blog&#x27;,
            &#x27;priority&#x27;: 0.8,
            &#x27;changeFreq&#x27;: &#x27;daily&#x27;
        },
        {
            &#x27;url&#x27;: &#x27;/products&#x27;,
            &#x27;priority&#x27;: 0.9
        }
    ],
    &#x27;baseUrl&#x27;: &#x27;https://example.com&#x27;,
    &#x27;changeFreq&#x27;: &#x27;weekly&#x27;,
    &#x27;priority&#x27;: 0.5,
    &#x27;includeLastMod&#x27;: true
}

        headers = {
            'x-api-key': API_KEY,
            'Content-Type': 'application/json'
        }

        response = requests.post(API_URL, headers=headers, json=request_body)

        # Raise exception for HTTP errors
        response.raise_for_status()

        data = response.json()

        # Check API response status
        if data.get('status') == 'ok':
            print('✓ Success!')
            print('Response data:', json.dumps(data['data'], indent=2))
            return data['data']
        else:
            print('✗ API Error:', data.get('error', 'Unknown error'))
            return None

    except requests.exceptions.RequestException as e:
        print(f'✗ Request failed: {e}')
        return None

if __name__ == '__main__':
    print('📤 Calling Sitemap Generator API...\n')

    result = call_sitemapgenerator_api()

    if result:
        print('\n📊 Final Result:')
        print(json.dumps(result, indent=2))
    else:
        print('\n✗ API call failed')
