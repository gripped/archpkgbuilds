# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=python-pytest-env
pkgver=1.2.0
pkgrel=2
pkgdesc='pytest plugin to set environment variables in pytest.ini or pyproject.toml file'
arch=(any)
url='https://github.com/pytest-dev/pytest-env'
license=(MIT)
depends=(python python-pytest)
makedepends=(
  git
  python-build
  python-installer
  python-hatchling
  python-hatch-vcs
)
source=("$pkgname::git+$url#tag=$pkgver")
sha512sums=('e6520925171cca0da8f6b2c31d902ca32f8e207915d575d2352f9f62780115e62bbc9eb88ea9416723684f51c3a7881a613f729967ebd4cce13b594b4291c213')
b2sums=('739f0195e5c89a63cbcfcff3915afcabadc14ce8c5189dc98d9b7639be7f948de3fa485696579336f1ae6cc1c91bc4862982afda49dd9bdb50a93850a4cf6920')

build() {
  cd "$pkgname"

  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  # temporary install
  python -m installer --destdir="$(pwd)/tmp" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$(pwd)/tmp/$site_packages"

  pytest -v
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
