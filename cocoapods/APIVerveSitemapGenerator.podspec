Pod::Spec.new do |s|
  s.name             = 'APIVerveSitemapGenerator'
  s.version          = '1.2.3'
  s.summary          = 'Sitemap Generator is a website sitemap generator API that creates valid XML sitemaps from URL lists following the sitemaps.org protocol...'
  s.description      = <<-'DESC'
Sitemap Generator is a website sitemap generator API that creates valid XML sitemaps from URL lists following the sitemaps.org protocol for search engine optimization.

This iOS/macOS SDK provides a convenient way to access the Sitemap Generator from APIVerve.
Supports both callback-based and async/await patterns.
                       DESC

  s.homepage         = 'https://apiverve.com/marketplace/sitemapgenerator?utm_source=cocoapods&utm_medium=referral&utm_content=homepage'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'APIVerve' => 'hello@apiverve.com' }
  # The SDK repo holds every language; the pod lives under cocoapods/ with its own tag.
  s.source           = { :git => 'https://github.com/apiverve/sitemapgenerator-api.git', :tag => "cocoapods/v#{s.version}" }

  s.ios.deployment_target = '15.0'
  s.osx.deployment_target = '12.0'

  s.swift_version = '5.0'

  s.source_files = 'cocoapods/Sources/APIVerveSitemapGenerator/**/*.swift'

  s.frameworks = 'Foundation'

  # APIResponse, APIVerveError and the request plumbing, shared by every APIVerve pod.
  s.dependency 'APIVerveCore', '~> 1.2'
end
