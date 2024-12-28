# Maintainer: Leonidas Spyropoulos <artafinde@archlinux.org>

pkgname=memray
pkgver=1.14.0
pkgrel=3
pkgdesc="A memory profiler for Python"
arch=('x86_64')
url="https://github.com/bloomberg/memray"
license=('Apache-2.0')
depends=('python' 'libunwind' 'python-rich' 'python-jinja' 'lz4' 'ipython' 'python-textual')
makedepends=('git' 'python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel' 'cython' 'npm' 'python-pkgconfig')
source=("git+$url.git#tag=v${pkgver}?signed")
sha512sums=('c6dc3035288e77bdff097fc5c80a337abbdc8252138a23e1b0aa8d6cb4e8edc7840a2f7b6c38f94a69f458b2d8fea296d8b4759dd92089c1811b3b87e2f2527b')
validpgpkeys=('A035C8C19219BA821ECEA86B64E628F8D684696D') # Pablo Galindo Salgado <pablogsal@gmail.com>

build() {
  cd "${pkgname}"

  export DIST_NAME='Arch Linux'
  export DIST_PACKAGE="$pkgver-$pkgrel"
  export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
  export CFLAGS+=" -ffat-lto-objects"
  export CXXFLAGS+=" -ffat-lto-objects"

  make build
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
