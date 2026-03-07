# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>

pkgname=python-sphinxcontrib-mermaid
pkgver=2.0.1
pkgrel=1
pkgdesc='Mermaid diagrams in yours sphinx powered docs'
arch=(any)
url='https://github.com/mgaitan/sphinxcontrib-mermaid'
license=(BSD-2-Clause)
depends=(
	python
	python-sphinx
  python-packaging
  python-docutils
  python-pyyaml
  python-jinja
)
makedepends=(
  git
	python-build
	python-installer
	python-setuptools
	python-wheel
)
checkdepends=(
	python-pytest
)
source=("$pkgname::git+$url#tag=$pkgver")
sha512sums=('a4e5349d8dc9778297b612a11079fb5188a4ed795ad7e09a263085d8e0ceb9c46a4f04809067e709e966c7737355bd894d6c19ec3957686b0dad39d8be17c02a')
b2sums=('62bc8b5aa7f9c0bf2be551f088e9e3478d629989ebbd2efc30c2922eb10c4130d969fe8b4650ecfd4c98078310b10732dcd5d99b5cac41778041293361d0e0c8')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  pytest -v --fixtures
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
