# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Florian Pritz <bluewind@xinu.at>

pkgname=python-ansi2html
pkgver=1.9.3
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
sha512sums=('50becd7117bc22df106974d46b42e6c04d440fa3265224fe81debd6e0208f7c00d706e803fedbd1227e2f7a13ec6f4594ebcb0e899a2e1e676ebf11ef2864a8b')
b2sums=('632c3d2ebe4aa1efd9c581af325c802dc4758e37b6633d596a762ed85dd2361ca1c64bec32cd18c0e07fa0d431be31a663522d421de46c684a99f18d41e0e026')

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
