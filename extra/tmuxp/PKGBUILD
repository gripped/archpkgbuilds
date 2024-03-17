# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=tmuxp
pkgver=1.43.0
pkgrel=1
pkgdesc="Tmux session manager built on libtmux"
arch=(any)
url="https://tmuxp.git-pull.com/en/latest/"
_url="https://github.com/tmux-python/tmuxp"
license=(MIT)
depends=(
  python
  python-colorama
  python-libtmux
  python-pyyaml
  python-typing_extensions
)
makedepends=(
  python-build
  python-installer
  python-poetry-core
  python-shtab
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-mock
  python-pytest-rerunfailures
)
optdepends=(
  'python-shtab: for workspace completion and import'
  'ipython: for alternative CLI'
  'python-prompt_toolkit: for alternative CLI'
  'bpython: for alternative CLI'
  # TODO: package ptpython for additional alternative CLI
)
source=($pkgname-$pkgver.tar.gz::$_url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('2dec0c941e919258fd884374fe89cf8e558483a50d53a4c6e3148f7639057aa365a959c062ea6929301dcd893b8a6794c002102f030d77fb904eeaa31ec30edd')
b2sums=('ebaa230723288a37334ee55c9b615610d66aacc5b01d6bf70576de38e9aa1ecc29a7d26299b55880e9ede403855304de080ddec6a16798a269d6bb8d4629498c')

build() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation

  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
  mkdir -v completions
  shtab --shell=bash tmuxp.cli.create_parser > completions/$pkgname
  shtab --shell=zsh tmuxp.cli.create_parser > completions/_$pkgname
}

check() {
  local python_options=(
    -vv
    # https://github.com/tmux-python/tmuxp/issues/855
    --deselect tests/workspace/test_builder.py::test_window_shell
  )
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $pkgname-$pkgver
  export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
  pytest "${python_options[@]}" tests
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 {CHANGES,README.md} -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 examples/*.{json,yaml} -t "$pkgdir/usr/share/doc/$pkgname/examples/"
  install -vDm 644 completions/$pkgname -t "$pkgdir/usr/share/bash-completion/completions/"
  install -vDm 644 completions/_$pkgname -t "$pkgdir/usr/share/zsh/site-functions/"
}

# vim:set ts=2 sw=2 et:
