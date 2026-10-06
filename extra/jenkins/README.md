# jenkins

## Updating java version

The java versions supported by Jenkins are documented [here](https://www.jenkins.io/doc/book/platform-information/support-policy-java/).

To upgrade the package to use the latest supported java version:

- bump the version in the custom `_java` variable in the PKGBUILD
- bump the version in the binary path of the `JAVA` variable in the [`jenkins.conf`](https://gitlab.archlinux.org/archlinux/packaging/packages/jenkins/-/blob/main/jenkins.conf) environment file
