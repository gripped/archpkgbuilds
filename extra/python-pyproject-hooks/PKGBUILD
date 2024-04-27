# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-pyproject-hooks
_name=${pkgname#python-}
pkgver=1.0.0
pkgrel=7
pkgdesc="A low-level library for calling build-backends in pyproject.toml-based project"
arch=(any)
url="https://github.com/pypa/pyproject-hooks"
license=(MIT)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-flit-core
  python-wheel
)
checkdepends=(
  python-pytest
  python-setuptools
  python-testpath
)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('fca9b69859d7e3949b158c2879ba7ebc7305f1edaacdd84b71a92565010176d1194be03a21fd6b9aa65d175cfd8243ba3a50aab617fb56ceac6b263da6613e17')
b2sums=('c90d2fb70ada9414cbbf201bfbb695b4e9055b61fdcdc8e0f8a2548e4f47e7512140fc71fee9f9306577d97b76ca64e77b7c58d526381c5481739e630e5250a1')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  export PYTHONPATH="$PWD/src:$PYTHONPATH"
  pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
