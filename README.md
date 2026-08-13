# jekyll-potion

<p align="left">
  <a href="https://badge.fury.io/rb/jekyll-potion">
    <img src="https://badge.fury.io/rb/jekyll-potion.svg" alt="Gem Version" />
  </a>
  <a href="https://github.com/changgunkim/jekyll-potion/actions/workflows/test.yml">
    <img src="https://github.com/changgunkim/jekyll-potion/actions/workflows/test.yml/badge.svg" alt="Test" />
  </a>
  <a href="https://github.com/changgunkim/jekyll-potion/blob/main/LICENSE">
    <img src="https://img.shields.io/badge/License-Apache_2.0-brightgreen.svg" alt="License" />
  </a>
</p>

## 소개

`jekyll-potion` 은 [Jekyll](https://jekyllrb.com/) 기반의 NUGU developers 문서 사이트 제작을 위해 작성된 [Jekyll](https://jekyllrb.com/) [Plugins](https://jekyllrb.com/docs/plugins/) 로서, 향후 유사한 형태의 문서 사이트 구축시 빠르고 쉽게 작업할 수 있도록 고려된 도구입니다.

`jekyll-potion` 은 간단한 설정만으로 제공하는 Processor, Tag 를 사용하여 문서 작성자로 하여금 보다 풍부한 문서를 작성할 수 있도록 도와주며 커스터마이징 과정을 통해 동일한 기능을 다른 look & feel 을 가질 수 있도록 합니다.  

## 목표

* 문서 작성자로 하여금 기본 markdown 문법, 제공되는 태그를 활용하여 향상된 문서를 작성할 수 있도록 함
* 제공되는 기본 테마를 커스터마이징하거나 새롭게 만들어, 새로운 look & feel 을 문서 사이트를 구축할 수 있도록 함
* 제공되는 Processor 를 통해, 문서 navigation, favicon, 검색 등의 기능을 지원

## 주요 기능

* **Tag**: `alerts`, `api`, `code`, `file`, `link`, `logo`, `navigation`, `pagination`, `tabs` 등 문서 작성에 특화된 Liquid 태그 제공
* **Processor**: 페이지 렌더링 결과(HTML)에 title/description meta, favicon, 검색 인덱스, 헤더 링크, og 태그 등을 자동으로 삽입/가공하는 후처리 파이프라인 제공
* **Theme**: 기본 제공되는 `proto` 테마를 그대로 쓰거나, 커스텀 테마로 교체 가능

각 기능의 상세 사용법은 [사용하기](#사용하기) 섹션의 데모 사이트를 참고하세요.

## 시스템 요구사항

* Ruby >= 3.2.0
* jekyll ~> 4.4, >= 4.4.1
* nokogiri ~> 1.19

> Ruby 3.2 미만 환경에서는 `jekyll-potion` 1.1.0 이상을 설치할 수 없습니다. 자세한 배경은 [CHANGELOG.md](CHANGELOG.md#110---2026-08-13)를 참고하세요.

## 설치

`jekyll-potion` 은 사이트의 Gemfile, config 파일(ex> _config.yml)  에 아래의 내용을 추가함으로서 사용이 가능합니다.

```ruby
group :jekyll_plugins do
  gem "jekyll-potion", "1.1.0"
end
```

```yaml
plugins:
  - jekyll-potion

# jekyll-sass-converter(jekyll 기본 의존성)를 사용하는 사이트라면
# sass 섹션이 반드시 선언되어 있어야 합니다. (jekyll-potion 테마 처리기가 이 값을 사용합니다.)
sass:
  style: compressed

jekyll_potion:
  site:
    title: "My Docs"
  processor: []
```

## 사용하기

`jekyll-potion` 이 적용된 데모 사이트이자, 설명 사이트인 [jekyll-potion](https://nugudevelopers.github.io/jekyll-potion) 을 통해 자세한 사용법을 확인하실 수 있습니다.

## 개발하기

이 저장소를 클론해 `jekyll-potion` 자체를 수정/검증하는 경우:

```shell
bundle install
bundle exec rspec
```

* `spec/site_build_spec.rb`: fixture 사이트를 실제로 빌드해 렌더링 결과(HTML)를 검증하는 통합 테스트
* `spec/jekyll_potion/processor/`: 개별 processor 로직에 대한 단위 테스트

PR을 올리면 GitHub Actions가 Ruby 3.2/3.3/3.4 조합으로 테스트를 자동 실행합니다. 의존성(`jekyll`, `nokogiri` 등)은 Dependabot이 주 단위로 업데이트 PR을 생성합니다.

## 트러블슈팅

* **`bundle install` 시 nokogiri 네이티브 확장 빌드 실패**: 오래된 nokogiri 버전(1.13.x 등)에 고정된 상태로 Ruby 3.2 이상을 쓰면, 사전 컴파일 바이너리가 없어 소스 빌드가 강제되고 최신 macOS/Xcode 툴체인에서 실패할 수 있습니다. `jekyll-potion` 1.1.0 이상은 nokogiri `~> 1.19`를 사용해 Ruby 3.2+ 용 사전 컴파일 바이너리를 그대로 사용하므로 이 문제가 발생하지 않습니다. (배경: [CHANGELOG.md](CHANGELOG.md))
* **`NoMethodError: undefined method '[]=' for nil:NilClass` (`make-theme-processor.rb` 관련)**: 사이트의 `_config.yml`에 `sass:` 섹션이 없을 때 발생합니다. 위 [설치](#설치) 예시처럼 최소 `sass: { style: compressed }`를 선언하세요.

## 변경 이력

전체 변경 이력은 [CHANGELOG.md](CHANGELOG.md) 를 참고하세요.
