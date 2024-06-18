# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-phonenumbers
pkgver=8.13.39
pkgrel=1
pkgdesc="Python version of Google's common library for parsing, formatting, storing and validating international phone numbers"
arch=('any')
url="https://github.com/daviddrysdale/python-phonenumbers"
license=('Apache-2.0')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-protobuf')
source=("git+https://github.com/daviddrysdale/python-phonenumbers.git#tag=v$pkgver")
sha512sums=('011aaf9605554083532abc4e3a3bffe89622895c790afcfc9bdbfc52f3f7f90200057f9821e9fadd89eba4e7060d8322e4763b0fd447417e5ba1d5cd85e73449')

build() {
  cd python-phonenumbers/python
  python -m build --wheel --no-isolation
}

check() {
  cd python-phonenumbers/python
  python -m unittest -v
}

package() {
  cd python-phonenumbers/python
  python -m installer --destdir="$pkgdir" dist/*.whl
}
