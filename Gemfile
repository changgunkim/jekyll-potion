source "https://rubygems.org"
# Hello! This is where you manage which Jekyll version is used to run.
# When you want to use a different version, change it below, save the
# file and run `bundle install`. Run Jekyll with `bundle exec`, like so:
#
#     bundle exec jekyll serve
#
# This will help ensure the proper Jekyll version is running.
# Happy Jekylling!
gem "jekyll", "~> 4.4", ">= 4.4.1"
gem "webrick", "~> 1.7"
# This is the default theme for new Jekyll sites. You may change this to anything you like.
# gem "minima", "~> 2.5"
# If you want to use GitHub Pages, remove the "gem "jekyll"" above and
# uncomment the line below. To upgrade, run `bundle update github-pages`.
# gem "github-pages", group: :jekyll_plugins
# If you have any plugins, put them here!
group :jekyll_plugins do
  # TODO: jekyll-potion 1.1.0 이 rubygems.org 에 게시되면 아래를 `gem "jekyll-potion", "1.1.0"` 로 교체할 것.
  # 1.1.0 은 nokogiri 를 ~> 1.19 로 올려 Ruby 3.2+ 에서 사전 컴파일 바이너리를 사용하도록 수정한 버전이다.
  gem "jekyll-potion", github: "changgunkim/jekyll-potion", branch: "develop"
  gem "jekyll-spaceship", "0.10.2"
end

# Windows and JRuby does not include zoneinfo files, so bundle the tzinfo-data gem
# and associated library.
platforms :mingw, :x64_mingw, :mswin, :jruby do
  gem "tzinfo", ">= 1", "< 3"
  gem "tzinfo-data"
end

# Performance-booster for watching directories on Windows
gem "wdm", "~> 0.1.1", :platforms => [:mingw, :x64_mingw, :mswin]

# Lock `http_parser.rb` gem to `v0.6.x` on JRuby builds since newer versions of the gem
# do not have a Java counterpart.