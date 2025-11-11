# Maintainer: Maxim Baz <archlinux at maximbaz dot com>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: James Zhu <jameszhu@berkeley.edu>

pkgname=python-black
pkgver=25.11.0
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
sha512sums=('62495ee47ce609081c816eff7a903fea9a2912e8caa6d5e41a21acae06c770954ec7dc6edfa442cd16b6d1de4c5c37f0fb559dda89bf873036d41d1625a27584')
b2sums=('8ea5b0f68e8dcd0adc9a5aafee7630779294aa0ba2262d030509e128ebd67a88e316fa20fe9cd8baa946be5ba2a5edf8fadf419c3d01bb29534700fa2ced0e93')

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
