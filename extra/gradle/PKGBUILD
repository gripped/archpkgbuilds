# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Contributor: Chris Molozian (novabyte) <chris DOT molozian AT gmail DOT com>
# Contributor: Sanjuro Makabe (itti) <vuck AT gmx DOT de>

pkgbase=gradle
pkgname=('gradle' 'gradle-doc' 'gradle-src')
pkgver=8.10
pkgrel=1
pkgdesc='Powerful build system for the JVM'
url='https://gradle.org/'
arch=('any')
license=('Apache')
depends=('java-environment<=21' 'bash' 'which' 'coreutils' 'findutils' 'sed')
makedepends=('git' 'asciidoc' 'xmlto' 'groovy' 'java-environment=11')
source=(https://services.gradle.org/distributions/${pkgbase}-${pkgver}-src.zip
        https://services.gradle.org/distributions/${pkgbase}-${pkgver}-all.zip
        ${pkgbase}.sh)
sha256sums=('2029241814a433f5b10adab87cc4d2b9cc34183ebdec797c644b2a898755ea55'
            '682b4df7fe5accdca84a4d1ef6a3a6ab096b3efd5edf7de2bd8c758d95a93703'
            '6f3472486278252417af49196847ba465b56819d286658fcdf918687f89ee032')
sha512sums=('5be572aa6e53bc879f09a489dc72e013b8bfc6dd9aeeb121375e04713f33531df9d4b09846446dc9f8019d1cf1cd7ffa9346aae71993c8af310516f55b26895c'
            'b0888ba212c82306de2bef79d8fa091dabfeb5eeebd8f5075b3f9657df81d7263c496a35dd9a8e4d06476cad6879ae5176750e60951cd6900893dc6590739ab8'
            'a50b6cf8281b56b80f55a20ac9316e1eed6887da1d191ad575dec140c9819711644d7077c4dc693b8cb0f1b08ceba0033ba88b5ad138d33ffb73b786c0d4bf81')

prepare() {
  cd ${pkgbase}-${pkgver}
  # remove ADOPTIUM contraint from all build related files
  sed -i '/JvmVendorSpec.ADOPTIUM/d' \
    build-logic-settings/build-environment/build.gradle.kts \
    build-logic-commons/module-identity/build.gradle.kts \
    build-logic-commons/gradle-plugin/build.gradle.kts \
    build-logic/jvm/src/main/kotlin/gradlebuild.unittest-and-compile.gradle.kts \
    build-logic-commons/gradle-plugin/src/main/kotlin/gradlebuild/commons/JavaPluginExtensions.kt \
    build-logic-commons/code-quality-rules/build.gradle.kts \
    build-logic-commons/basics/build.gradle.kts \
    platforms/documentation/docs/src/snippets/java/toolchain-filters/kotlin/build.gradle.kts \
    platforms/jvm/language-java/src/integTest/groovy/org/gradle/jvm/toolchain/JavaToolchainDownloadIntegrationTest.groovy

  # inhibit automatic download of binary gradle
  sed -i "s#distributionUrl=.*#distributionUrl=file\:${srcdir}/${pkgbase}-${pkgver}-all.zip#" \
    gradle/wrapper/gradle-wrapper.properties
}

build() {
  cd ${pkgbase}-${pkgver}
  # requires java language level 6, which >=13 has dropped
  export PATH="/usr/lib/jvm/java-11-openjdk/bin:${PATH}"
  ./gradlew installAll \
    -Porg.gradle.java.installations.auto-download=false \
    -PfinalRelease=true \
    -Pgradle_installPath="$(pwd)/dist" \
    --no-configuration-cache
}

package_gradle() {
  cd ${pkgbase}-${pkgver}/dist
  optdepends=(
    'gradle-doc: gradle documentation'
    'gradle-src: gradle sources'
  )

  # install profile.d script
  install -Dm 755 "${srcdir}"/${pkgbase}.sh "${pkgdir}"/etc/profile.d/${pkgbase}.sh

  # create the necessary directory structure
  install -d "${pkgdir}"/usr/share/java/${pkgname}/bin
  install -d "${pkgdir}"/usr/share/java/${pkgname}/lib/{plugins,agents}
  install -d "${pkgdir}"/usr/share/java/${pkgname}/init.d
  install -d "${pkgdir}"/usr/bin

  # copy across jar files
  install -Dm 644 lib/*.jar "${pkgdir}"/usr/share/java/${pkgname}/lib
  install -Dm 644 lib/plugins/*.jar "${pkgdir}"/usr/share/java/${pkgname}/lib/plugins
  install -Dm 644 lib/agents/*.jar "${pkgdir}"/usr/share/java/${pkgname}/lib/agents

  # copy across supporting text documentation and scripts
  install -m 644 NOTICE "${pkgdir}"/usr/share/java/${pkgname}
  install -m 755 bin/gradle "${pkgdir}"/usr/share/java/${pkgname}/bin
  install -m 644 init.d/*.* "${pkgdir}"/usr/share/java/${pkgname}/init.d

  # link gradle script to /usr/bin
  ln -s /usr/share/java/${pkgname}/bin/${pkgname} "${pkgdir}"/usr/bin
}

package_gradle-doc() {
  pkgdesc+=' (documentation)'
  options=('!strip')

  cd ${pkgbase}-${pkgver}/dist
  install -d "${pkgdir}"/usr/share/java/gradle/docs
  cp -r docs/* "${pkgdir}"/usr/share/java/gradle/docs
}

package_gradle-src() {
  pkgdesc+=' (sources)'
  options=('!strip')

  cd ${pkgbase}-${pkgver}/dist
  install -d "${pkgdir}"/usr/share/java/gradle/src
  cp -r src/* "${pkgdir}"/usr/share/java/gradle/src
}

# vim: ts=2 sw=2 et:
