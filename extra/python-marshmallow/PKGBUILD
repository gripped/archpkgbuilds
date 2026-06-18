# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-marshmallow
pkgver=4.2.4
pkgrel=1
pkgdesc="A lightweight library for converting complex datatypes to and from native Python datatypes."
url="https://github.com/marshmallow-code/marshmallow"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-flit-core')
checkdepends=('python-pytest' 'python-simplejson')
source=("git+https://github.com/marshmallow-code/marshmallow.git#tag=$pkgver")
sha512sums=('eefecd790502c39a7f3ca7464e398fc4a653a8854375a129daf907cd2bc2e008cc515f2bfc059446aed764a3a8a3af28565d2537e082bec8eb76264551077798')

prepare() {
  cd marshmallow
  sed -i 's/"flit_core>=3.12,<4"/"flit_core"/' pyproject.toml
}

build() {
  cd marshmallow
  python -m build --wheel --no-isolation
}

check() {
  cd marshmallow
  python -m venv --system-site-packages .testenv
  .testenv/bin/python -m installer dist/*.whl
  .testenv/bin/python -m pytest
}

package() {
  cd marshmallow
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
