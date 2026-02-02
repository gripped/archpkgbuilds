# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=tmuxp
pkgver=1.64.0
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
sha512sums=('84e54be070ca94688a873cdcdfd8af3214ea53fe6ae02a92994f0f9bee7d7401b2e77be9f2e4a3ada4d973a328ef89117d6fe9b315ffabd845e5f5cde5ad10b6')
b2sums=('e26c2095450259f2f2fb919939e61f7559233915f209b1e0957ca27f53dfe8bbcd6e53aec4a243eb88aabf60336c69aa855b617564603e6ecdaa1ea86d82ed34')

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
