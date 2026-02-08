# Maintainer: Maxim Baz <archlinux at maximbaz dot com>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: James Zhu <jameszhu@berkeley.edu>

pkgname=python-black
pkgver=26.1.0
pkgrel=1
pkgdesc='Uncompromising Python code formatter'
arch=(any)
url='https://github.com/psf/black'
license=(MIT)
depends=(
  python
  python-click
  python-mypy_extensions
  python-packaging
  python-pathspec
  python-platformdirs
  python-pytokens
)
makedepends=(
  git
  python-build
  python-hatch-fancy-pypi-readme
  python-hatch-vcs
  python-hatchling
  python-installer
)
checkdepends=(
  ipython
  python-aiohttp
  python-parameterized
  python-pytest
  python-tokenize-rt
)
optdepends=(
  'ipython: for Jupyter notebook support'
  'python-tokenize-rt: for Jupyter notebook support'
  'python-aiohttp: for the blackd HTTP server'
  'python-colorama: for colored diffs'
)
source=("$pkgname::git+$url#tag=$pkgver")
sha512sums=('6166cf8417dc7dc3b15596ea4017c2da87ff89d63970dc995203bf2afa91e515c7144d97b0f4120b6841ae1e2c2bcac1df010e47b5d7e4bb90f2a35f74973ab4')
b2sums=('0a11f29cb166d81f1afd09a72682ec78e4ace96fcd68cff87fc550aa269bf8b37ab1f9786a4a2d26606e01fda64233714ffb010c10cb58711619c99e7b279c1a')

build() {
  cd "$pkgname"

  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "$pkgname"

  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  # https://github.com/psf/black/issues/3251#issuecomment-1236413890
  ulimit -n 2048
  PATH="$PWD/test-env/bin:$PATH" test-env/bin/python -m pytest
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # vim plugin
  install -Dm644 -t "$pkgdir/usr/share/vim/vimfiles/plugin" plugin/black.vim
  install -Dm644 -t "$pkgdir/usr/share/vim/vimfiles/autoload" autoload/black.vim
}

# vim:set ts=2 sw=2 et:
