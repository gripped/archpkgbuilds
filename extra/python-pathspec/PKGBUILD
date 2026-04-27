# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor:  Chris Severance aur.severach aATt spamgourmet dott com

pkgname=python-pathspec
_name=${pkgname#python-}
pkgver=1.1.0
pkgrel=1
pkgdesc='Utility library for gitignore style pattern matching of file paths'
arch=('any')
url=https://github.com/cpburnz/python-pathspec
license=('MPL-2.0')
depends=('python')
makedepends=(
  'git'
  'python-build'
  'python-flit-core'
  'python-installer'
  'python-wheel'
)
optdepends=(
  'python-google-re2: re2 backend'
)
source=("git+$url.git#tag=v$pkgver")
b2sums=('e3e015081ef77966297b5e2676bf46f7c2f952252d01616583beb85a98cafe9d03c80ea265d875cc168bc68e65603b313d6c2281a0a7ff7bb909fe18b5bf1e2f')

build() {
  cd $pkgname
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $pkgname
  python -m unittest
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
