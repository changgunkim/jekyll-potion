require "jekyll"
require "jekyll-potion"
require "fileutils"
require "tmpdir"
require "stringio"

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.example_status_persistence_file_path = ".rspec_status"
  config.disable_monkey_patching!
  config.default_formatter = "doc" if config.files_to_run.one?
  config.order = :random
  Kernel.srand config.seed
end

module JekyllPotionSpecHelper
  FIXTURE_SITE_SOURCE = File.expand_path("fixtures/site", __dir__)

  def build_fixture_site
    destination = Dir.mktmpdir("jekyll-potion-spec")

    config = Jekyll.configuration(
      "source" => FIXTURE_SITE_SOURCE,
      "destination" => destination,
      "quiet" => true
    )

    site = nil

    Dir.chdir(FIXTURE_SITE_SOURCE) do
      silence_stdout do
        site = Jekyll::Site.new(config)
        site.process
      end
    end

    yield site, destination
  ensure
    FileUtils.remove_entry(destination) if destination && File.exist?(destination)
  end

  def silence_stdout
    original_stdout = $stdout
    $stdout = StringIO.new
    yield
  ensure
    $stdout = original_stdout
  end
end

RSpec.configure do |config|
  config.include JekyllPotionSpecHelper
end