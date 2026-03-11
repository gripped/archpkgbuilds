# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=jedi-language-server
pkgver=0.46.0
pkgrel=1
pkgdesc='Language server for Jedi'
arch=(any)
url=https://github.com/pappasam/jedi-language-server
license=(MIT)
depends=(
  python-docstring-to-markdown
  python-jedi
  python-pygls
)
makedepends=(
  git
  python-build
  python-installer
  python-poetry-core
)
checkdepends=(
  python-lsp-jsonrpc
  python-pyhamcrest
  python-pytest
)
source=("git+$url.git#tag=v$pkgver")
b2sums=('214344f72a30f41e18d225217b4973bdada147f944711e0cae46c20576e0744af320fddd15c2e44e0ba8646ba91c4a544e662dc785179b080dced087fbe3a33e')

build() {
  cd $pkgname
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $pkgname
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  python -m installer --destdir=temp dist/*.whl
  PATH="$PWD/temp/usr/bin:$PATH" test-env/bin/python -m pytest tests
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/${pkgname//-/_}-$pkgver.dist-info/licenses/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname

  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}
