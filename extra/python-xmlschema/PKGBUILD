# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-xmlschema
pkgver=4.3.0
pkgrel=1
epoch=1
pkgdesc='An XML Schema validator and decoder'
arch=(any)
url='https://github.com/sissaschool/xmlschema'
license=(MIT)
depends=(python python-elementpath)
makedepends=(
  git
  python-build
  python-installer
  python-wheel
  python-setuptools
)
checkdepends=(python-lxml python-jinja)
optdepends=('python-jinja: for XSD based code generators')
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('1c7e7016f843fa663e13656a9de430981e8e599aecda858d414d80fe46dd601b71efe735df665adcc85511d15dd00b55d31bfad520d90a302c3ddcfc28b1d963')
b2sums=('cb3f6d7f9ed6c0610f84f36a0112c6b6e7de687ed0f560db5f478ed5c5e1e11c19bfdf9771e093bdbb20bb4e239724680173e2a954e87b90955baec5e2b09dbc')


build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  PYTHONPATH="$PWD" python -m unittest
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
