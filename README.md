Composer Project Template for CCEI
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
* [CCEI Bootstrap][ccei_bootstrap]

### WxT

The [Drupal WxT][wxt] distribution is a web content management system which assists in building and maintaining innovative Web sites that are accessible, usable, and interoperable. This distribution is open source software and free for use by departments and external Web communities. This distribution relies and integrates extensively with the WET-BOEW jQuery Framework for improved accessible markup.

### CCEI Core

The [CCEI Core][ccei_core] module houses all of the additional customization that are made on top of Drupal WxT. Normally this can all be done in an (sub) installation profile but for the moment to reduce complexity this is the current route.

### CCEI Bootstrap

The [CCEI Bootstrap][ccei_bootstrap] theme which itself is a sub theme of [WxT Bootstrap][wxt_bootstrap] houses all of the additional theming related customizations that are made on top of of [Drupal WxT][wxt].

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


[ccei_core]:                  https://github.com/StatCan/ccei/tree/8.x-1.x/modules/custom/ccei_core
[ccei_bootstrap]:             https://github.com/StatCan/ccei/tree/8.x-1.x/themes/custom/ccei_bootstrap
[ci]:                         https://travis-ci.org/statcan/site-ccei
[ci-badge]:                   https://travis-ci.org/statcan/site-ccei.svg?branch=8.x
[composer]:                   https://getcomposer.org
[node]:                       https://nodejs.org
[wxt]:                        https://github.com/drupalwxt/wxt
