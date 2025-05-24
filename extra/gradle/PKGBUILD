# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Contributor: Chris Molozian (novabyte) <chris DOT molozian AT gmail DOT com>
# Contributor: Sanjuro Makabe (itti) <vuck AT gmx DOT de>

pkgbase=gradle
pkgname=('gradle' 'gradle-doc' 'gradle-src')
pkgver=8.14.1
pkgrel=1
pkgdesc='Powerful build system for the JVM'
url='https://gradle.org/'
arch=('any')
license=('Apache')
depends=(
  'bash'
  'coreutils'
  'findutils'
  'java-environment>=21'
  'sed'
  'which'
)
makedepends=(
  'asciidoc'
  'git'
  'groovy'
  'java-environment=11'
  'java-environment=17'
  'java-environment=21'
  'xmlto'
)
source=(https://services.gradle.org/distributions/${pkgbase}-${pkgver}-src.zip
        https://services.gradle.org/distributions/${pkgbase}-${pkgver}-all.zip
        ${pkgbase}.sh)
sha256sums=('488a3181f5f8ee3f16182b59712a5f1139c172b558ff93e665fe7be3ca796621'
            'd7042b3c11565c192041fc8c4703f541b888286404b4f267138c1d094d8ecdca'
            '4728dbdbe9fe416b82977cb7e456457e3ff0b88129291ee28e0d874ce8cc4891')
sha512sums=('8288a48f8afcbbfe56d07a3ce111e1b755cfa12c03e44cf4674dad325aa506cc416cb697c12a6678d2e01340cd665e25a87c55944c4feb710d1f508f020f4805'
            'a96eb44b3ea6b77397e1f648a3988c79ba04cb8a92c4f29145c5cd2d5ebe86afd31701b425c0ee64b3075ab3b4127abb10bfa74c2535c1dfa06cb2b91f36e47d'
            '9054a13f13a0d04bffefb2e5c1bcabfcd7b11e4d83d9180f65e0a09eeb8fea407d8c4e1e1e9b79191ba99e4eb372dbbb3189dd30833170c64cdb4484ca559441')

prepare() {
  cd ${pkgbase}-${pkgver}
  # remove adoptium references because we want to use our java implementation
  grep -lr "vendor = JvmVendorSpec.ADOPTIUM" | xargs sed -i "/JvmVendorSpec.ADOPTIUM/d"

  # inhibit automatic download of binary gradle
  sed -i "s#distributionUrl=.*#distributionUrl=file\:${srcdir}/${pkgbase}-${pkgver}-all.zip#" \
    gradle/wrapper/gradle-wrapper.properties
}

build() {
  cd ${pkgbase}-${pkgver}
  ./gradlew installAll \
    --info \
    -Porg.gradle.java.installations.paths=/usr/lib/jvm/java-21-openjdk \
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
  install -Dm 644 "${srcdir}"/${pkgbase}.sh "${pkgdir}"/etc/profile.d/${pkgbase}.sh

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
