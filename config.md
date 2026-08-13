---
depth_order: 4
---

# 설정

`jekyll-potion` 의 기본적으로 설정을 추가하지 않아도 동작합니다. 하지만 설정을 통해 사이트, 부가적인 기능을 활성화 할 수 있으며 아래의 내용은 모든 설정 항목입니다.

{% alerts style="warning" %}
`jekyll_potion` 설정과 별개로, `_config.yml` 에 아래와 같이 `sass` 설정이 반드시 선언되어 있어야 합니다. 기본 제공 테마(`proto`)가 scss 자산을 포함하고 있어, 이 값이 없으면 사이트 빌드 시 오류가 발생합니다.

{% code %}
```yaml
sass:
  style: compressed
```
{% endcode %}
{% endalerts %}

{% code %}
```yaml
jekyll_potion:
  site:
    index_page: ""
    permalink: ""
    title: ""
    icon: ""
    theme: "proto"
    favicon: ""
    exclude:
      -
  theme:
    - theme_name:  
        path: ""
        layouts_dir: "_layouts"
        includes_dir: "_includes"
        default_layout: "default"
        assets:
          target_root_path: "_assets"
          source_dir: "assets"
          priority_files:
            -
          scss_source_dir: "_scss"
          scss_files:
            -
        templates_dir: "_templates"
        content_x_path: "main"
        tags:
          alerts:
            info: "info"
            warning: "warning"
            danger: "danger"
            success: "success"
          code:
            code_class: "code"
            success_class: "copy-text"
            success_show_class: "show"
          tabs:
            tabs_class: "tabs"
            active_class: "active"
          navigation:
            active_class: "active"
            fold_class: "fold"
        processors:
          make_header_link_processor:
            selector: "data-header-link"
            hash_class: "go-hash"
            copy_class: "copy-link"
          rewrite_img_processor:
            skip_keyword: "data-skip-src-to-absolute"
            inline_image_class: "img-inline"
            internal_image_class: "img-internal"
          rewrite_a_href_processor:
            skip_keyword: "data-skip-href-to-absolute"
            index_page_keyword: "data-to-index-page"
            hash_link_class: "hash-internal"
            internal_link_class: "a-internal"
          make_search_index_processor:
            skip_keyword: "data-skip-search-index"
            search_file_name: "search.json"
  processors:
    - make_navigation_processor
    - make_empty_content_processor
    - make_header_link_processor
    - rewrite_img_processor
    - rewrite_a_href_processor
    - make_search_index_processor
    - make_og_tag_processor
```
{% endcode %}

| 항목                        | 설명                                                                                        |
|:--------------------------|:------------------------------------------------------------------------------------------|
| `jekyll_potion`           | `jekyll_potion` 설정 Root                                                                   |
| `jekyll_potion.site`      | `jekyll_potion` Site 설정 Root<br/>자세한 설명은 [Site 설정](./config/site) 에서 다룹니다.                |
| `jekyll_potion.theme`     | `jekyll_potion` theme 설정 Root<br/>자세한 설명은 [Theme 설정](./config/theme) 에서 다룹니다.             |
| `jekyll_potion.processor` | `jekyll_potion` processor 설정 Root<br/>자세한 설명은 [Processor 설정](./config/processor) 에서 다룹니다. |
