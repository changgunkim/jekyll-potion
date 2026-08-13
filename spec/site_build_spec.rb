require "spec_helper"
require "nokogiri"

RSpec.describe "building a site with jekyll-potion" do
  it "renders the index page with a title and description derived from the page content" do
    build_fixture_site do |_site, destination|
      output_path = File.join(destination, "index.html")
      expect(File).to exist(output_path)

      html = Nokogiri::HTML.parse(File.read(output_path))

      expect(html.css("title").text).to eq("Fixture Site - Hello World")
      expect(html.at_css('meta[http-equiv="Title"]')["content"]).to eq("Fixture Site - Hello World")
      expect(html.at_css('meta[http-equiv="Description"]')["content"])
        .to eq("A fixture page used by the jekyll-potion regression test suite.")
    end
  end
end