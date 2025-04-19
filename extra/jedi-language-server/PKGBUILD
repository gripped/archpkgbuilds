# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=jedi-language-server
pkgver=0.45.0
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
b2sums=('7313c97d0c5d6fdc14680a491d0f04b448e26a65d00155c8f8e730c4074ee787255d713593a50e331feb64a227af68fd8d12501b19b1ae10d05f3dcbc63cfe88')

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
