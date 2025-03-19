# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=jedi-language-server
pkgver=0.44.0
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
b2sums=('79ca3e7b8c42405366d263c62a0b1b9cdc85db4f9f05f41d8542cdb75318c4e2626f1bd6e8558c5054410f2bd9a2152b055c2ce1830dc527fb1cf2d3adaeffe0')

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
  ln -s "$site_packages"/${pkgname//-/_}-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}
