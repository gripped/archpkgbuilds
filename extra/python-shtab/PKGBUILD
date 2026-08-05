# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: SZanko, szanko at protonmail dot com

pkgname=python-shtab
pkgver=1.9.3
pkgrel=1
pkgdesc='Automagic shell tab completion for Python CLI applications'
arch=(any)
url='https://github.com/iterative/shtab'
license=(Apache-2.0)
depends=(python)
makedepends=(
  git
  python-build
  python-installer
  python-wheel
  python-setuptools-scm
)
checkdepends=(
  python-pytest
  python-pytest-timeout
)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('834ce9cd0267358b71591b194ce363825dba88f6165a5fcb12c485476692f0841bb8899493ba52a709d973de68d3c1bcc598d8d1f0c9a61e23900ec8142d0432')
b2sums=('1e0ba8fdedfd52fa4c86fa2a0a85e0c8aa4f90c1bc4d77f73a5543cbcdaca98321251116624a389362c199d3e6a481690a7d3d1cca4c2d882ff06c83885284b8')

build() {
  cd "$pkgname"

  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build --wheel --no-isolation

  # temporary install
  python -m installer --destdir="$(pwd)/tmp" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$(pwd)/tmp/$site_packages"

  # generate shell completions
  for shell in bash zsh; do
    python -m shtab --print-own-completion "$shell" > "$shell.completion"
  done
}

check() {
  cd "$pkgname"

  pytest -v --override-ini="addopts="
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # shell completions
  install -vDm644 bash.completion "$pkgdir/usr/share/bash-completion/completions/shtab"
  install -vDm644 zsh.completion "$pkgdir/usr/share/zsh/site-functions/_shtab"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENCE
}
