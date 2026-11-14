# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=python-u-msgpack
pkgver=2.9.0
pkgrel=1
pkgdesc='A portable, lightweight MessagePack serializer and deserializer written in pure Python'
arch=(any)
url='https://github.com/vsergeev/u-msgpack-python'
license=(MIT)
depends=(python)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('e7fb874356eb61c6eed74aa3ef568944af479c686c57a3771bece81aa93ef12bf649eca9003bc3a21d99367314fc0576659a5255a79c35340f4809d399c70ec1')
b2sums=('5c78a8175099b5bcaea9c847aa7f8f0f015d26a4dbaedddb1916caf949310b4e6a0fedc1ea5c56f628797daca910d96d71586c7535a29c659894d90c1468e87e')

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

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
