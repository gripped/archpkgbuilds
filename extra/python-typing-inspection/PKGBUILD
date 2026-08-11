# Maintainer: Christian Heusel <gromit@archlinux.org>

_name=typing-inspection
pkgname=python-typing-inspection
pkgver=0.4.3
pkgrel=1
pkgdesc="Runtime typing introspection tools"
arch=(any)
url="https://github.com/pydantic/typing-inspection"
license=(MIT)
depends=(
    python
    python-typing_extensions
)
makedepends=(
    git
    python-build
    python-installer
    python-setuptools
    python-setuptools-scm
    python-wheel
    python-hatchling
)
checkdepends=(
    python-pytest
)
source=("git+https://github.com/pydantic/typing-inspection#tag=v${pkgver}")
sha512sums=('e09b443b306f86b44863378d89ee7af71d7592aa536a487169dfe07073b6f7b573a510c1094cb8f4e397e2b3bce32f3b632ca0f93f5d37030a1385c5311d70bb')
b2sums=('423fb2a56e68d4af37c95e3a4c5f801b63aae8d4fff34deb01f140a91b54a1a8032e6d2c9e0a31ee72b480281aaa9b1111cff26442dfa751fde31db059eb1a45')

build() {
  cd $_name
  python -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name
  python -m installer --destdir="tmp_install" dist/*.whl
  export PYTHONPATH="$PWD/tmp_install/$_site_packages/:$PYTHONPATH:$PWD/tests"
  pytest -vv -k 'not test_mysql'
}

package() {
  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl
}
