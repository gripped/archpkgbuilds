# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>

_name=setuptools_scm
pkgname=python-setuptools-scm
pkgver=9.2.1
pkgrel=1
pkgdesc='Handles managing your python package versions in scm metadata'
arch=(any)
url=https://github.com/pypa/setuptools_scm
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
checkdepends_riscv64=(
  libxml2
  libxslt
)
optdepends=(
  'python-rich: use rich as console log handler'
)
source=("git+$url.git#tag=v$pkgver")
sha512sums=('9d6aa839fde52835b5d1b5512f6a0aef8f477ff4b4fbb3089a5f86ce454d380b3aa5af650f057292af4c4cf90fd79c337ff006eef7684275307b80658e492879')
b2sums=('fbceb4ccbdbef84c02015a6eb7070e6a360402523783a36168308a2c1417fcd88cab4b26f40fd71c410407f78be82ec8e2fff5025264a340cc511ae25f2ee874')

build() {
  cd $_name
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_name
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -vk 'not test_not_owner'
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/$_name-$pkgver.dist-info/licenses/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname

  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl
}
