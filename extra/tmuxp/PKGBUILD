# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=tmuxp
pkgver=1.67.0
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
sha512sums=('b0d68796f323b449a5abf6c1cc64e21d1faadbc69a0b26696fd4456fbe871ea6c2408e7e18d002128d7576be3ef36988e4fceccf16200e53d1f021cc73c88165')
b2sums=('4637b7403c1f5699719b754b46d018ad8e90807f590c1ffba3e9877f46cf292e3d2cade7e63bdd46a984cddad95d926ba804fbde5ee7a75ad72bf5c52f9e7c09')

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
