# Changelog

All notable changes to this project will be documented in this file.

## [unreleased]

### 🚀 Features

- *(services)* Isolate PlantUML proxy and container in shared private netns - ([40fe258](https://git.0xmax42.io/maxp/Reactive-PlantUML/commit/40fe258dea747d0de0d2cfbc08867b4804027ef2))
- *(services)* Migrate PlantUML services to instance-based units - ([7f885eb](https://git.0xmax42.io/maxp/Reactive-PlantUML/commit/7f885eb3ceeb4b3dda106b022e490f6a78fb8be8))
- *(services)* Add systemd units for PlantUML-Server container setup - ([bc62760](https://git.0xmax42.io/maxp/Reactive-PlantUML/commit/bc627602feef5fdded515f0f9e39f71a923d7caf))
- Add Docker setup for PlantUML server with healthcheck - ([22ba2d8](https://git.0xmax42.io/maxp/Reactive-PlantUML/commit/22ba2d8e18b626c90cbde8008fbacc4610392d6e))

### 🐛 Bug Fixes

- *(services)* Increase service startup timeout to 120 seconds so that the build unit is not terminated - ([9bfa036](https://git.0xmax42.io/maxp/Reactive-PlantUML/commit/9bfa036e6b6dd3584a33a541a3001c282827addd))
- *(quadlet)* Use .build image reference and remove redundant dependencies - ([284406d](https://git.0xmax42.io/maxp/Reactive-PlantUML/commit/284406d4a9f9429cd9625b7fce3ec23fede6a107))

### ⚙️ Miscellaneous Tasks

- *(ci)* Add workflow to build and publish DEB package on release - ([fd3a421](https://git.0xmax42.io/maxp/Reactive-PlantUML/commit/fd3a421059ff7591771e285e5a4e7117055a0554))
- *(release)* Add workflow for automated changelog and release - ([167c77c](https://git.0xmax42.io/maxp/Reactive-PlantUML/commit/167c77c637b0e78e57dbbd28449177c5c929ed09))
- *(debian)* Add postinst and postrm scripts for systemd user units - ([df60cb5](https://git.0xmax42.io/maxp/Reactive-PlantUML/commit/df60cb5d40a79c65f24f9caa398b91ae72ec320d))
- *(debian)* Add rules file with systemd user override - ([4d63c14](https://git.0xmax42.io/maxp/Reactive-PlantUML/commit/4d63c14ff0c09a9ffd2e8f0c124ec8429736a685))
- Add dist/ directory to gitignore - ([0ab5cb7](https://git.0xmax42.io/maxp/Reactive-PlantUML/commit/0ab5cb7b1aa1da3fa1e70c94ae79a048cc873797))
- *(config)* Require podman >= 5.0 in package dependencies - ([eeb714a](https://git.0xmax42.io/maxp/Reactive-PlantUML/commit/eeb714a623415cbc4e003d73d353d4f1f9340057))
- *(debian)* Add packaging config and install scripts - ([5f33a57](https://git.0xmax42.io/maxp/Reactive-PlantUML/commit/5f33a572d3eef4d61de588edf9ee982a5db39eff))


