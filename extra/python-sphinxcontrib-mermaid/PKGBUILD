# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>

pkgname=python-sphinxcontrib-mermaid
pkgver=2.0.0
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
sha512sums=('a0bbf9eef6a6bd6597e1d5a8eeb4806e618587864e1510c1a497f210622087f1a5660e093c5c2a429df550218f9cb98e4724de31df0b7d86cc3326e377a567e0')
b2sums=('4f58c4cd464e3d7383cc6a767bb0841a92274e2642cb0e13d9000687214f00227dc187d4363d6132de31aceeef4ba700eaf465825aab4056052adbb8550821f0')

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
