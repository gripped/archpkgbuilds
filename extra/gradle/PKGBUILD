# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Contributor: Chris Molozian (novabyte) <chris DOT molozian AT gmail DOT com>
# Contributor: Sanjuro Makabe (itti) <vuck AT gmx DOT de>

pkgbase=gradle
pkgname=('gradle' 'gradle-doc' 'gradle-src')
pkgver=9.5.0
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
sha256sums=('01224207a274ac35f45880f641c8fec496906fd2d51ffcb38389ee4c7c56e2c3'
            'a3c4ba4aca8f0075688b9c5b18939fd28e8cb4357c227da5c1d9f38343791439'
            '4728dbdbe9fe416b82977cb7e456457e3ff0b88129291ee28e0d874ce8cc4891')
sha512sums=('19c8917a00cf7da433838571c95d25f6b75a9848c059c3eafdc3a740c4109094e07cb880e75d0e5402f385d5a2b8417495da2fea8f2cb718b14a72dd31f77aca'
            '60eb5c644a2fd2c756b7efe47020dcdcda98f9cc531522da18254beda85f969e734359cae15a058a40486777ad8e4c307be8d68a8fbd18566c93dc3ff309b979'
            '9054a13f13a0d04bffefb2e5c1bcabfcd7b11e4d83d9180f65e0a09eeb8fea407d8c4e1e1e9b79191ba99e4eb372dbbb3189dd30833170c64cdb4484ca559441')

prepare() {
  cd ${pkgbase}-${pkgver}
  # remove adoptium references because we want to use our java implementation
  grep -lr "vendor = JvmVendorSpec.ADOPTIUM" | xargs sed -i "/JvmVendorSpec.ADOPTIUM/d"

  # inhibit automatic download of binary gradle
  sed -i "s#distributionUrl=.*#distributionUrl=file\:${srcdir}/${pkgbase}-${pkgver}-all.zip#" \
    gradle/wrapper/gradle-wrapper.properties

  # isolated projects requires configuration cache; disable both so we can build without it
  sed -i '/org\.gradle\.unsafe\.isolated-projects/d' gradle.properties
  sed -i '/org\.gradle\.configuration-cache/d' gradle.properties
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

  # copy across jar files and module descriptor properties files
  install -Dm 644 lib/*.jar lib/*.properties "${pkgdir}"/usr/share/java/${pkgname}/lib
  install -Dm 644 lib/plugins/*.jar lib/plugins/*.properties "${pkgdir}"/usr/share/java/${pkgname}/lib/plugins
  install -Dm 644 lib/agents/*.jar lib/agents/*.properties "${pkgdir}"/usr/share/java/${pkgname}/lib/agents

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
