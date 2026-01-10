# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=python-feedparser
_name=${pkgname#python-}
pkgver=6.0.12
pkgrel=2
pkgdesc='Parse RSS and Atom feeds in Python'
arch=(any)
url=https://github.com/kurtmckee/feedparser
license=(BSD-2-Clause)
depends=(
  libxml2
  python-requests
  python-sgmllib3k
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-chardet)
optdepends=(
  'python-chardet: for character encoding auto-detection'
  'python-cchardet: for faster character encoding auto-detection'
)
source=("git+$url.git#tag=v$pkgver")
b2sums=('56d292deaf8d794a0f4375159817c78c5a7e3c34364e2bf608509d8a7c0e4b4cc78848c8a0ff8280c702cdcb03a0f6313d04072b6c903cfb4dfb356e9a1f200e')

build() {
  cd "$_name"
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "$_name"
  # https://github.com/kurtmckee/feedparser/issues/236
  mv tests/illformed/undeclared_namespace.xml{,.bak}
  PYTHONPATH="$PWD/build/lib" python tests/runtests.py
  mv tests/illformed/undeclared_namespace.xml{.bak,}
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()0)")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/"$_name"-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname

  cd "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
