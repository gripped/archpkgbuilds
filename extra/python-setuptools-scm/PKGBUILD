# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=python-setuptools-scm
pkgver=9.2.0
pkgrel=1
pkgdesc='Handles managing your python package versions in scm metadata'
arch=(any)
url='https://github.com/pypa/setuptools_scm'
license=(MIT)
depends=(
  python
  python-packaging 
  python-setuptools
)
makedepends=(
  git
  python-build
  python-installer
  python-wheel
)
checkdepends=(
  mercurial
  python-pip
  python-pytest
  python-pytest-timeout
  python-rich
)
optdepends=(
  'python-rich: use rich as console log handler'
)
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha512sums=('1620b4153b46220216cf680a40694b5e8978d2b7b03b91949d312ac88fe4f2b2f6147f9295e568f7d9cc072519c8ee86cd5c2744c1648470585abaede4b74c93')
b2sums=('55a8a6e926c2cf817b859fd89a62795a1ae7c36a452c9abdbd951d55b6333d0df86cfef2ccda4fd1d9e375860fe6777e145151808d9800a8bb706f684e260dbb')

build() {
  cd "$pkgname"

  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "$pkgname"

  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -vk 'not test_not_owner'
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
