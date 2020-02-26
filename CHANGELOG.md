# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## 2.0.0

## Added
- Support for hundreds of config options that can be used to change proxy behaviour.

## Changed
- Switches from bitly Oauth Proxy to the [pusher/oauth2_proxy/](https://github.com/pusher/oauth2_proxy/) fork.
- Changes in environment variable names. Please see [MIGRATION.md](MIGRATION.md) for details.

## Removed
- Removes omnigollum dependency, wasn't being used