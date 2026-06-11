# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-readme-renderer
pkgver=45.0
pkgrel=1
pkgdesc='A library that will safely render arbitrary README files into HTML'
arch=(any)
url='https://github.com/pypa/readme_renderer'
license=(Apache-2.0)
depends=(
  python
  python-docutils
  python-pygments
  python-nh3
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
  python-comrak
)
checkdepends=(python-pytest)
optdepends=('python-comrak: for Markdown support')
source=("$pkgname::git+$url#tag=$pkgver")
sha512sums=('92c1b60ec379a7039bb35ccd05e09ef33115b3f9c2e01e2b8737b3a99d24eb58d247fe602e911be348b3240a5d7e49756ca17997a97c8b116672ea1ca7394a89')
b2sums=('58a29e6b00fe48a2f31baf3c2c8b5f3b5760ebf9c207c14db8327eaef5bd954889e1a1c2ff727caf4124b97226a72e499b41ffcc55a60aaf37643e299e384631')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  pytest -v
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
