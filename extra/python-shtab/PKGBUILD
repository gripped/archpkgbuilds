# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: SZanko, szanko at protonmail dot com

pkgname=python-shtab
pkgver=1.12.0
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
  python-click
  python-pytest
  python-pytest-timeout
)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('b950cfa9c079d46b5903a424f9c2eba0f55577a69bfd2e094dfac171e92a2c4d4176496239152b23c5a503e7ef079bd9b7b43b7d9c9b278bf92d7025e9d2cfd9')
b2sums=('3afd6e8bb09e6ac943b6bdb642fb110b2d9ffdf47eefcbe722ef24892f766e7fc176f9fbaa98e010866bee6e7887741f7501a70f9185c30ace97f8b02dea8269')

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
