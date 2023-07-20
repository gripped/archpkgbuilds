# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

_name=identify
pkgname=python-identify
pkgver=2.5.25
pkgrel=1
pkgdesc="File identification library for Python"
arch=(any)
url="https://github.com/pre-commit/identify"
license=(MIT)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
  python-ukkonen
)
optdepends=(
  'python-editdistance-s: for returning license identifiers'
  'python-ukkonen: for returning license identifiers'
)
source=($_name-$pkgver.tar.gz::https://github.com/pre-commit/$_name/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('4d7845d4941f67a58c3d8e49a4067d852a3a8c4f060b32c9e58c7b400cc7e595ca4dd6268392a7a17f9768f97bc1719d7611c4b029fb91eefbc2a62537df3815')
b2sums=('4e7403d9d4abc44945a697ca8f2362a707e47ce92c59e4302283d23486510f1b215a08752ed1b737b428d4048fd750997469dbc433a4e78b074aa723f27e7150')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
