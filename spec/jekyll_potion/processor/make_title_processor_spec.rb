require "spec_helper"
require "jekyll-potion/processor/make-title-processor"

RSpec.describe Jekyll::Potion::MakeTitleProcessor do
  subject(:processor) { described_class.new(nil, nil, nil, nil) }

  def fake_page(content:, data: {})
    instance_double(Jekyll::Page, content: content, data: data)
  end

  describe "#make_title" do
    it "extracts an ATX heading (# Title)" do
      page = fake_page(content: "# Hello World\n\nSome body text.")
      expect(processor.make_title(page)).to eq("Hello World")
    end

    it "extracts a setext heading (Title\\n===)" do
      page = fake_page(content: "Hello World\n===\n\nSome body text.")
      expect(processor.make_title(page)).to eq("Hello World")
    end

    it "falls back to the front matter title when no heading is present" do
      page = fake_page(content: "Some body text with no heading.", data: { "title" => "Fallback Title" })
      expect(processor.make_title(page)).to eq("Fallback Title")
    end
  end
end