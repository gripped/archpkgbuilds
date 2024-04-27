# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=python-pt
_gitcommit=3efc26ef739ae78730ea60851c84d9c08ca8a63d
pkgver=r20231230.107.3efc26e
pkgrel=2
pkgdesc='gdb script to examine the address space of a QEMU-based virtual machine'
url='https://github.com/martinradev/gdb-pt-dump'
arch=('any')
license=('MIT')
depends=(
  gdb
  python
)
makedepends=(
  git
  python-build
  python-installer
  python-poetry-core
  python-wheel
)
provides=(gdb-pt-dump)
source=(git+"${url}#commit=${_gitcommit}")
sha512sums=('SKIP')
b2sums=('SKIP')

pkgver() {
  cd gdb-pt-dump
  printf "r%s.%s.%s" "$(TZ=UTC git show -s --pretty=%cd --date=format-local:%Y%m%d HEAD)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd gdb-pt-dump
  python -m build --wheel --no-isolation
}

package() {
  cd gdb-pt-dump
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
