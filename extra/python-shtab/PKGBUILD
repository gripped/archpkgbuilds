# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: SZanko, szanko at protonmail dot com

pkgname=python-shtab
pkgver=1.10.0
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
sha512sums=('52fb7761605739d6f7d9338138abf8bd5cd05d7295c92735c2211eddc5eceda643c952bfb7329b06c9964b6c56e3915e97cfd66f2bf52b482a16acf1c2e9cc3f')
b2sums=('81a5c3e2cba064ece684ce0c7b0150228be190219908c37ba2c9ff8bb76f6702a46d5c0357c546e501f9dc38fecfcc3c2f139d7a4f858b7dda42e43b79a507a1')

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
