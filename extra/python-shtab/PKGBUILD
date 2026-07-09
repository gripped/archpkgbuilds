# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: SZanko, szanko at protonmail dot com

pkgname=python-shtab
pkgver=1.8.1
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
source=(
  "$pkgname::git+$url#tag=v$pkgver"
  remove-cov.patch
)
sha512sums=('fdaaefc105e60a0c4d9f6dc1236fb4d5765f6c5b60595a4d0484e73383028f8e7d922c230efbc063c45900f8690a489b7f5a87317f45cacf5f8d2fe171815e76'
            '3882aa428baf71962a07a78b7f4093bd72f132ac925c9df1b762a2c9039f897a9351f0ee63e0d7c3a5dbb483eeea3061f4eae40c81f61968d03cf1717e9cbd95')
b2sums=('c0d31b2aff2035afbb404dab619004fc526058ff93353c8495c64f1b8dfd44fdf8da55601af5b67adf78167b6a48938283cbb19190b7bf6d892b805755bc9dcf'
        '34be5c86be092fbdf124f011f8179b637c815af89b21d0ea5bab72fbddffe907dc30f91435c5f1d889dea4ea13c3554e7d63bcd73e36eab6cf205f6815e214c0')

prepare() {
  cd "$pkgname"

  patch -p1 -i "$srcdir/remove-cov.patch"
}

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

  pytest -v
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
