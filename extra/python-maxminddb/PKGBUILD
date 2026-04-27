# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-maxminddb
pkgver=3.1.1
pkgrel=1
pkgdesc="Reader for the MaxMind DB format"
url="https://github.com/maxmind/MaxMind-DB-Reader-python"
license=('Apache-2.0')
arch=('x86_64')
depends=('python' 'libmaxminddb')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools'
             'python-setuptools-scm')
checkdepends=('python-pytest')
source=("git+https://github.com/maxmind/MaxMind-DB-Reader-python.git#tag=v$pkgver"
        "git+https://github.com/maxmind/MaxMind-DB.git"
        "git+https://github.com/maxmind/libmaxminddb.git")
sha512sums=('a59f37093afb4892bc6ec4f22f0071b60db744bcc1241dadda5b5998628c9e3661a4c20a6a90eb236a85f2b0c0d1ad3b5c2f749b38ee87381997150a00fd6dea'
            'SKIP'
            'SKIP')

prepare() {
  cd MaxMind-DB-Reader-python
  git config submodule.tests/data.url "$srcdir"/MaxMind-DB
  git config submodule.extension/libmaxminddb.url "$srcdir"/libmaxminddb
  git -c protocol.file.allow=always submodule update --init
}

build() {
  cd MaxMind-DB-Reader-python
  python -m build -nw
}

check() {
  cd MaxMind-DB-Reader-python
  python -m installer -d tmp_install dist/*.whl
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  PYTHONPATH=tmp_install/usr/lib/python${python_version}/site-packages pytest
}

package() {
  cd MaxMind-DB-Reader-python
  python -m installer -d "$pkgdir" dist/*.whl
}
