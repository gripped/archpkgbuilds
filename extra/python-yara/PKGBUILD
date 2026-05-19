# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: arch3y <arch3y[at]archstrike[dot]org>

pkgname=python-yara
pkgver=4.5.5
pkgrel=1
pkgdesc='Tool aimed at helping malware researchers to identify and classify malware samples'
url='https://github.com/VirusTotal/yara-python'
license=(Apache-2.0)
arch=(
  x86_64
)
depends=(
  glibc
  libyara.so
  python
  yara
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
)
source=(
  "$pkgname::git+https://github.com/VirusTotal/yara-python#commit=v$pkgver?signed"
)
b2sums=('9fd00fcf49e07e3814ee4337dd537f43306c23f02a4eca4080a5531c1c58ec35c0a35deb2f53b270b35fc553a8643ecce0a331fa690458cbcb06ea5cd232e167')
validpgpkeys=('2A05514ACB63CB0E0C89DEE2B471460BB894AB84') # Victor M. Alvarez <vmalvarez@virustotal.com>

build() {
  cd $pkgname
  python -m build --wheel --no-isolation \
    -C--global-option=build_ext \
    -C--global-option=--dynamic-linking
}

check() {
  cd $pkgname
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests.py
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 -t "$pkgdir/usr/share/doc/$pkgname" README.rst
  ln -vs /usr/share/doc/yara/docs "$pkgdir/usr/share/doc/$pkgname/docs"
}
