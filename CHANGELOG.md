# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/).

## [1.1.0] - 2026-08-13

### Added

- RSpec test suite: a fixture-site integration test (`spec/site_build_spec.rb`)
  that builds a real Jekyll site through the plugin and asserts on the
  rendered `<title>`/meta tags, plus unit tests for
  `MakeTitleProcessor#make_title` (`spec/jekyll_potion/processor/make_title_processor_spec.rb`)
- GitHub Actions CI (`.github/workflows/test.yml`) running the test suite on
  every push/PR across a Ruby 3.2 / 3.3 / 3.4 matrix
- Dependabot (`.github/dependabot.yml`) for weekly `bundler` and
  `github-actions` dependency update PRs
- Development `Gemfile` (`gemspec` + `rspec` as a development dependency) so
  the gem can be exercised locally without a consumer site

### Changed

- **BREAKING**: `required_ruby_version` raised from `>= 2.6.0` to `>= 3.2.0`
- `jekyll` dependency raised from `>= 4.2.2` to `~> 4.4`, `>= 4.4.1`
- `nokogiri` dependency raised from `~> 1.13.6` to `~> 1.19`

### Why

nokogiri 1.13.x only ships precompiled native binaries for Ruby < 3.2. On
Ruby 3.2+ this forced a source build, which fails on current toolchains
(e.g. recent Xcode/macOS) due to a native extension build issue in that
nokogiri series. Upgrading to nokogiri 1.19.x provides officially supported
precompiled binaries for Ruby 3.2+, avoiding the source build entirely.
`jekyll` was raised to the latest 4.4 series for consistency; no code
changes were required since only stable, unchanged Jekyll APIs are used
(`Jekyll::Page`, `Jekyll::Theme`, `Jekyll::Hooks`, `Jekyll::SourceMapPage`,
`Jekyll::Converters::Scss`/`Markdown`).

### Migration

Consumers running Ruby < 3.2 must upgrade their Ruby version before
adopting this release.

## [1.0.1] - 2023-01-04

### Changed

- `jekyll` dependency relaxed from `~> 4.3.1` to `>= 4.2.2`

## [1.0.0] - 2022-12-22

### Added

- Initial release