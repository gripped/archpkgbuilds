# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=jedi-language-server
pkgver=0.45.1
pkgrel=2
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
b2sums=('f431d097c187a4d95a3a611f6793aeb85523765f6d55f9cee82ff3b6eadbd9ab50cd45c1fea929b015bbda0315d42a577c4c60821ee9decd2ac01930cd548ca7')

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
