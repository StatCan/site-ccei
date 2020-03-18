Composer Project template for CCEI
==================================

[![Build Status][ci-badge]][ci]

Drupal WxT codebase for `site-ccei`.

## Requirements

* [Composer][composer]
* [Node][node]

## Setup

Normally you can simply run a `composer install` but at the moment you might need to run the following:

```sh
export COMPOSER_MEMORY_LIMIT=-1 && composer install
```

## Dependencies

The `composer.json` file calls the following dependencies:

* [WxT][wxt]
* [CCEI Core][ccei_core]
* [CCEI Bootstrap][ccei_experiments]

### WxT

The [Drupal WxT][wxt] distribution is a web content management system which assists in building and maintaining innovative Web sites that are accessible, usable, and interoperable. This distribution is open source software and free for use by departments and external Web communities. This distribution relies and integrates extensively with the WET-BOEW jQuery Framework for improved accessible markup.

### CCEI Core

The [CCEI Core][ccei_core] module houses all of the additional customization that are made on top of Drupal WxT. Any additional contributed dependencies are declared in the [composer.json][ccei_core_composer] file and are installed in the [ccei_core.info.yml][ccei_core_info] file. Normally this can all be done in an (sub) installation profile but for the moment to reduce complexity this is the current route. All of the custom configuration for things such as `asset_injector`, `ckeditor templates`, and `webform` have been exported in the [config][ccei_core_config] folder.

### CCEI Bootstrap

The [CCEI Bootstra][ccei_bootstrap] theme which itself is a sub theme of [WxT Bootstrap][wxt_bootstrap] houses all of the additional theming related customizations that are made on top of of [Drupal WxT][wxt]. Any additional contributed dependencies are declared in the [composer.json][ccei_bootstrap_composer] file and are installed in the [ccei_core.info.yml][ccei_bootstrap_info] file. All of the custom theme configuration have been exported in the [config][ccei_bootstrap_config] folder.

## Project

For production releases you should only ever use a stable tag.

## New Project (stable tag)

```sh
composer create-project statcan/site-ccei:3.0.6 site-name
```

## New Project (dev)

```sh
composer create-project statcan/site-ccei:8.x-dev site-name
```

## Maintenance

List of common commands are as follows:

| Task                                            | Composer                                               |
|-------------------------------------------------|--------------------------------------------------------|
| Latest version of a contributed project         | ```composer require drupal/PROJECT_NAME:8.*```         |
| Specific version of a contributed project       | ```composer require drupal/PROJECT_NAME:8.1.0-beta5``` |
| Updating all projects including Drupal Core     | ```composer update```                                  |
| Updating a single contributed project           | ```composer update drupal/PROJECT_NAME```              |
| Updating Drupal Core exclusively                | ```composer update drupal/core```                      |


[ccei_core]:                  https://github.com/statcan/ccei_core
[ccei_core_composer]:         https://github.com/statcan/ccei_core/blob/8.x-1.x/composer.json
[ccei_core_info]:             https://github.com/statcan/ccei_core/blob/8.x-1.x/ccei_core.info.yml
[ccei_core_config]:           https://github.com/statcan/ccei_core/tree/8.x-1.x/config
[ccei_bootstrap]:             https://github.com/statcan/ccei_bootstrap
[ccei_bootstrap_composer]:    https://github.com/statcan/ccei_bootstrap/blob/8.x-1.x/composer.json
[ccei_bootstrap_info]:        https://github.com/statcan/ccei_bootstrap/blob/8.x-1.x/ccei_core.info.yml
[ccei_bootstrap_config]:      https://github.com/statcan/ccei_bootstrap/tree/8.x-1.x/config
[ci]:                         https://travis-ci.com/statcan/site-ccei
[ci-badge]:                   https://travis-ci.com/statcan/site-ccei.svg?branch=8.x
[composer]:                   https://getcomposer.org
[node]:                       https://nodejs.org
[wxt]:                        https://github.com/drupalwxt/wxt
