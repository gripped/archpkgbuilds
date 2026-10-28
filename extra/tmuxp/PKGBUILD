# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=tmuxp
pkgver=1.76.0
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
  python-hatchling
  python-shtab
  python-wheel
)
checkdepends=(
  python-docutils
  python-pytest
  python-pytest-mock
  python-pytest-rerunfailures
  python-sphinx
)
optdepends=(
  'python-shtab: for workspace completion and import'
  'ipython: for alternative CLI'
  'python-prompt_toolkit: for alternative CLI'
  'bpython: for alternative CLI'
  # TODO: package ptpython for additional alternative CLI
)
source=($pkgname-$pkgver.tar.gz::$_url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('3174629fb98f2b1893d34b15cdfe159220514c9d9f06bd57c32227d081ede436411d16feb6c772a04dbdcfa072f0b19ec1bb3ee3d3abbb047e02a23c0e61f598')
b2sums=('c1b2c0dd2c4979f38340bd5b43d022b10cb055ba37c92e98d14d4d3242bb64ba733c0172aec0ae868baaa8c10adfd20dd417c724bc8af5946d18800cf05f4644')

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
    --deselect 'tests/workspace/test_builder.py::test_pane_readiness_call_count[skips_all_panes_with_window_shell]'
    # https://github.com/tmux-python/tmuxp/issues/961
    --deselect tests/workspace/test_builder.py::test_global_options
    --deselect tests/workspace/test_builder.py::test_global_session_env_options
    --deselect tests/workspace/test_builder.py::test_environment_variables
    --deselect tests/workspace/test_builder.py::test_pane_readiness_custom_shell_skips_under_always
    # we are not interested in argparse tests
    --ignore tests/docs/_ext/test_pretty_argparse.py
  )
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $pkgname-$pkgver
  export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
  PATH="$PWD/test_dir/usr/bin:$PATH" pytest "${python_options[@]}" tests
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
