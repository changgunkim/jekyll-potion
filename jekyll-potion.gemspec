# SPDX-FileCopyrightText: Copyright 2022 SK TELECOM CO., LTD.
# SPDX-License-Identifier: Apache-2.0

Gem::Specification.new do |spec|
  spec.name                  = "jekyll-potion"
  spec.version               = "1.1.0"
  spec.summary               = "Jekyll's Potion"
  spec.authors               = ["SK TELECOM CO., LTD"]
  spec.email                 = ["changgun.kim@sk.com"]
  spec.homepage              = "https://github.com/nugudevelopers/jekyll-potion"
  spec.license               = "Apache-2.0"
  spec.files                 = Dir["LICENSE", "jekyll-potion.gemspec", "lib/**/*"]
  spec.required_ruby_version = ">= 3.2.0"

  spec.add_dependency "jekyll", "~> 4.4", ">= 4.4.1"
  spec.add_dependency "nokogiri", "~> 1.19"

  spec.add_development_dependency "rspec", "~> 3.13"
end
