# Changelog

All notable changes to this project will be documented in this file.

## [1.0.3-pre.1](https://git.0xmax42.io/maxp/Reactive-PlantUML/compare/v1.0.2..v1.0.3-pre.1) (pre-release) - 2025-12-27

### 🐛 Bug Fixes

- *(systemd)* Harden plantuml service with stricter sandboxing - ([539cf0b](https://git.0xmax42.io/maxp/Reactive-PlantUML/commit/539cf0b3271d22d9efb75b1a4042a66ba057a012))

### 🎨 Styling

- *(debian)* Adjust postinst echo message indentation - ([bf2b8ca](https://git.0xmax42.io/maxp/Reactive-PlantUML/commit/bf2b8cad240243638def1e7a296b878e84e246e1))

### ⚙️ Miscellaneous Tasks

- *(ci)* Publish deb packages to debrepo in release workflow - ([ddc44b5](https://git.0xmax42.io/maxp/Reactive-PlantUML/commit/ddc44b527dfb09a87aa03fc3d050156679a3f982))

## [1.0.2](https://git.0xmax42.io/maxp/Reactive-PlantUML/compare/v1.0.1..v1.0.2) - 2025-12-24

### 🐛 Bug Fixes

- *(systemd)* Bind plantuml socket to localhost - ([fc2a0e7](https://git.0xmax42.io/maxp/Reactive-PlantUML/commit/fc2a0e74fc87d25c72f7bc7bb9fc7e5065445bd1))

### 🚜 Refactor

- Consistently quote variable expansions in shell scripts - ([4aedfd6](https://git.0xmax42.io/maxp/Reactive-PlantUML/commit/4aedfd6dbfd2f0ad4e787300f80e97b0ab856ac4))

### ⚙️ Miscellaneous Tasks

- *(ci)* Update package names to versioned dependencies - ([9ef5cc1](https://git.0xmax42.io/maxp/Reactive-PlantUML/commit/9ef5cc17e7f44fa221d19693f57ede32f9f65974))
- *(ci)* Add release asset upload step to workflow - ([e9c7012](https://git.0xmax42.io/maxp/Reactive-PlantUML/commit/e9c7012e88b15d4e2ffd8c9ed154e3fc9914de5a))
- *(ci)* Add release sync step to workflow - ([5fdc33a](https://git.0xmax42.io/maxp/Reactive-PlantUML/commit/5fdc33a93cb33871c9db6c90e0dd2bb1563ab701))

## [1.0.1](https://git.0xmax42.io/maxp/Reactive-PlantUML/compare/v1.0.0..v1.0.1) - 2025-12-18

### 🐛 Bug Fixes

- *(build)* Use configurable container engine for build - ([e7294e7](https://git.0xmax42.io/maxp/Reactive-PlantUML/commit/e7294e7269144087229651e390a960c772d1086b))

### 📚 Documentation

- Add Debian-specific user service setup instructions - ([27fbadd](https://git.0xmax42.io/maxp/Reactive-PlantUML/commit/27fbadd8486e5823c4f003e02cad8af2908ba469))
- Add project documentation and license - ([9cb49b1](https://git.0xmax42.io/maxp/Reactive-PlantUML/commit/9cb49b150bd2409c13084a7498a10d91007f5833))

### ⚙️ Miscellaneous Tasks

- Add post-installation message to install target - ([cc9779e](https://git.0xmax42.io/maxp/Reactive-PlantUML/commit/cc9779e3e899a92455756587193c594efcbcf348))
- Add debug helper comment to run target in Makefile - ([b5d1190](https://git.0xmax42.io/maxp/Reactive-PlantUML/commit/b5d1190e7127f5f802c35dab30a2bc30fe987a07))
- *(ci)* Pass image name and tag to Docker test job - ([b0026da](https://git.0xmax42.io/maxp/Reactive-PlantUML/commit/b0026da75279d0a224207c2fdde916cd59f89fb2))
- *(ci)* Streamline test step and install make dependency - ([b8c2f3d](https://git.0xmax42.io/maxp/Reactive-PlantUML/commit/b8c2f3d2db03e03ca3e8ae21a38a39dee3010d7b))
- *(ci)* Increase apt-get install quietness in workflow - ([19faa36](https://git.0xmax42.io/maxp/Reactive-PlantUML/commit/19faa362b1ba062a88e0c5e8e0d167dac0d7342f))
- *(build)* Migrate install logic from debian to Makefile - ([08eb522](https://git.0xmax42.io/maxp/Reactive-PlantUML/commit/08eb5221d90b1e3a16bfbb39db94beeadecf53bc))
- *(debian)* Clarify port usage message in postinst script - ([f308cbc](https://git.0xmax42.io/maxp/Reactive-PlantUML/commit/f308cbccc742a655f9da2b4a60b41437fabebd08))

## [1.0.0](https://git.0xmax42.io/maxp/Reactive-PlantUML/compare/v0.1.5..v1.0.0) - 2025-12-18

### 🚀 Features

- *(service)* [**breaking**] Update socket ListenStream to use full instance variable as port; no prefix anymore - ([f94bc9d](https://git.0xmax42.io/maxp/Reactive-PlantUML/commit/f94bc9d1a839f0c11fe57d5665fee03db0b423c5))
- Enable UNIX socket activation and proxy for PlantUML server - ([84e6d1d](https://git.0xmax42.io/maxp/Reactive-PlantUML/commit/84e6d1d84d19c54cfc51a1eeae64368f70c5b071))

## [0.1.5](https://git.0xmax42.io/maxp/Reactive-PlantUML/compare/v0.1.3..v0.1.5) - 2025-12-17

### 🐛 Bug Fixes

- *(dockerfile)* Fix PlantUML download URL - ([beb8af5](https://git.0xmax42.io/maxp/Reactive-PlantUML/commit/beb8af5dad6cd57bacb146cd30187b02dff9d6e5))

### ⚙️ Miscellaneous Tasks

- *(dockerfile)* Update base image and dependency versions - ([1bb06b9](https://git.0xmax42.io/maxp/Reactive-PlantUML/commit/1bb06b93990fe369baad6562b7e342be57c0f404))
- *(ci)* Adjust delay timing in version bump workflow - ([7a8f365](https://git.0xmax42.io/maxp/Reactive-PlantUML/commit/7a8f365313b73e0d2f4df447297feabf9ac1e0e3))
- *(config)* Update renovate rules for update type handling - ([fdc83ce](https://git.0xmax42.io/maxp/Reactive-PlantUML/commit/fdc83cef7cf9c2a7a2b026afb8b89efb57605d38))
- *(ci)* Add workflow to auto bump version on dependency updates - ([3e5b814](https://git.0xmax42.io/maxp/Reactive-PlantUML/commit/3e5b8146bb25c72b4dfa9797af18e9c5a2c16096))
- *(config)* Add Renovate configuration for dependency automation - ([fb5e256](https://git.0xmax42.io/maxp/Reactive-PlantUML/commit/fb5e2563f3fd5821b0d567438155379efc08826d))
- *(dockerfile)* Pin dependencies with ARGs for reproducibility - ([4ec0123](https://git.0xmax42.io/maxp/Reactive-PlantUML/commit/4ec0123e9058edd7a535e646e8a98019a8888da2))
- *(ci)* Add workflow for Docker build and smoke test - ([ffd3515](https://git.0xmax42.io/maxp/Reactive-PlantUML/commit/ffd3515c2589474ffcde8d9cca90ff3d1e20fa92))

### 📦 Dependencies

- *(deps)* Update ubuntu:25.10 docker digest to 5922638 - ([cc124f1](https://git.0xmax42.io/maxp/Reactive-PlantUML/commit/cc124f1c8567619ea3802a8a3af03a77c8ffc05d))

## [0.1.3](https://git.0xmax42.io/maxp/Reactive-PlantUML/compare/v0.1.2..v0.1.3) - 2025-12-17

### 🐛 Bug Fixes

- Remove PrivateNetwork and namespace settings from service configs - ([a9815c0](https://git.0xmax42.io/maxp/Reactive-PlantUML/commit/a9815c09fb33aee8a3bb8a6c8d5da9a8b04f82b9))

## [0.1.2](https://git.0xmax42.io/maxp/Reactive-PlantUML/compare/v0.1.1..v0.1.2) - 2025-12-17

### 🐛 Bug Fixes

- Update postinst script usage instructions - ([f3159ab](https://git.0xmax42.io/maxp/Reactive-PlantUML/commit/f3159ab1e3b1d2911a11c66bddda47b7e1a25fa4))
- *(debian)* Update install paths for systemd and container services - ([3aa588b](https://git.0xmax42.io/maxp/Reactive-PlantUML/commit/3aa588b79bb89ed02d5215f8b5543512975b7bf6))

## [0.1.1](https://git.0xmax42.io/maxp/Reactive-PlantUML/compare/v0.1.0..v0.1.1) - 2025-12-17

### ⚙️ Miscellaneous Tasks

- *(debian)* Fix socket port offset usage message - ([a9c94d0](https://git.0xmax42.io/maxp/Reactive-PlantUML/commit/a9c94d0f24a3c21a34333be97ba525a21fbc43d7))

## [0.1.0] - 2025-12-17

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


