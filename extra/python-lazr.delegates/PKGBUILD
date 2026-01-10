# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-lazr.delegates
_name="${pkgname#python-}"
pkgver=2.1.1
pkgrel=2
pkgdesc="Easily write objects that delegate behavior"
arch=(any)
url="https://launchpad.net/lazr.delegates"
license=(LGPL-3.0-only)
depends=(
  python
  python-importlib-metadata
  python-setuptools  # pkg_resources is used to declare namespaces
  python-zope-interface
)
makedepends=(
  git
  python-build
  python-installer
  python-wheel
)
checkdepends=(python-pytest)
source=(git+https://git.launchpad.net/lazr.delegates#tag=$pkgver)
sha512sums=('6c9aad011b6a7c6d338543a4c710eb82a5907785c4e059c6b1235b52a0ca6437d1b0bda6dc15e3895516bbb0b0cdea0978c5307a140c08e12bfbdcd19e487aea')
b2sums=('580c3bba7805a1a79b8ee0a632d845aeaa35c0744217d75f184e8b80cd7323c38be79fe25b690594f582200d244f56daf8977b4859e377e358f4341708fcd00d')

build() {
  cd $_name
  python -m build --wheel --no-isolation
}

check() {
  cd $_name
  pytest -v
}

package() {
  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {CONTRIBUTING,NEWS,README}.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
