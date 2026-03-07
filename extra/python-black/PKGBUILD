# Maintainer: Maxim Baz <archlinux at maximbaz dot com>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: James Zhu <jameszhu@berkeley.edu>

pkgname=python-black
pkgver=26.3.0
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
sha512sums=('b7788d7ea827e1cdfc4b981b4d7c585512dd40a13a99a4ea967fa3620728ece06d999472e636b9c94b1ae5900d9e6b4cda95154921be633bddce59e8d35e074b')
b2sums=('fc39633fde4edfbba81527ac07e336c6c92e26cd09aaa8865cbdf0fc65024929713b0762cc84b70154d98c5a3ef3fe8c1374a91fb0a7f84eaa1c41f9f890426a')

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
