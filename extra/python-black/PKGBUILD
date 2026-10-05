# Maintainer: Maxim Baz <archlinux at maximbaz dot com>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: James Zhu <jameszhu@berkeley.edu>

pkgname=python-black
pkgver=26.10.0
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
sha512sums=('be23fd9ce50d94123f7b9f90930efdbbd9e957c992e59f6896663c7d0ccf696d3d9862ff219de8544ea3624a39e2f9a42eaf20c4ca6ef88d79a4859544b2d7ca')
b2sums=('0009619361c511fac37f52d8b21fccdec7864bd0730f94dbbb280ea31e727543adf3a8f1fadf2e8630a98d9117ef04555625b6c854e7e4626cab3d27b15ba62c')

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
