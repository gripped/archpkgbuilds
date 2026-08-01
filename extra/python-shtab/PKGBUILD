# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: SZanko, szanko at protonmail dot com

pkgname=python-shtab
pkgver=1.9.2
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
sha512sums=('8e2ae441bb7503279c93eeeb77a509e6aed260cf82828ed6c8429285b0ddee608116de51d608e08085c1dc57f52e24eaeea52f84128eb4960d004cf468da60d0')
b2sums=('e6c63a3ad256d6486f98d05a807877d5bf2ab51bc46061616097bc886b5d1acd262275e33f0b69920b26cc298759ca4ad208325deeb8c0373e18acd085ce2d0a')

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
