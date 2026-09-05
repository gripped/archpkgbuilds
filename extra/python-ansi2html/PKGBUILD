# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Florian Pritz <bluewind@xinu.at>

pkgname=python-ansi2html
pkgver=1.9.4
pkgrel=1
pkgdesc='Convert text with ANSI colour codes to HTML'
arch=(any)
url='https://github.com/pycontribs/ansi2html'
license=(LGPL-3.0-or-later)
depends=(python)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)
checkdepends=(python-pytest)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('65cb84414941da498ad5a2c08e2ff2de6ed4ec9c0aedb9053de0e3fe132d3e5ad45632d4a1285fdfc117effb415cffd03b943167cd32d4b7bf7bba1a8f8fc75f')
b2sums=('487beb7ab4f85f77bbf44944347f75624c74e78cb92a10313bc61823cae8fa6a45acd56d747b43a129aa8327b5df4fdb224fe230c89a0d962b38afea3b752995')

build() {
  cd "$pkgname"

  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  # temporary install
  python -m installer --destdir="$(pwd)/tmp" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$(pwd)/tmp/$site_packages"
  export PATH="$(pwd)/tmp/usr/bin:$PATH"

  pytest -vv
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
