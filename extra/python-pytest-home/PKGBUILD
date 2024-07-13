# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=python-pytest-home
_name=${pkgname#python-}
pkgver=0.5.1
pkgrel=1
pkgdesc='Home directory fixtures'
arch=(any)
url=https://github.com/jaraco/pytest-home
license=(MIT)
depends=(python-pytest)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)
source=("git+$url.git#tag=v$pkgver")
b2sums=('0c40dfb032944ec07ad9317a9889796818a61216223822ad7c4e2fb2106a2430f47957a18de5f6024c78920ad46a03f6f05a184c58946d8b3f789c66b8163bf2')

build() {
  cd "$_name"
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "$_name"
  PYTHONPATH="$PWD/${_name/-/_}:$PYTHONPATH" pytest
}

package() {
  cd "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/"${_name/-/_}"-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
