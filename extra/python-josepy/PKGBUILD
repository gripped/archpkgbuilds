# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-josepy
pkgver=2.3.0
pkgrel=1
pkgdesc='JOSE protocol implementation in Python'
arch=('any')
url='https://github.com/certbot/josepy'
license=('Apache-2.0')
depends=(
  'python'
  'python-cryptography'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-poetry-core'
)
checkdepends=('python-pytest')
source=(
  "$pkgname::git+$url#tag=v$pkgver"
  'no-thanks-poetry.patch'
)
sha512sums=('8019e70caa05e7adc001d7b7346d95b43c8f5106b501bf621c6131d5fc86cf83b22462de6b7c02d14c5a5dbaf24ed9638d2d9e35c119a9390f9c64fdca70a916'
            '5fc9682dbb93a3af76bb07653ec873c40a2acad24484ce64babde7d342390439efad018d5b5fda88df7338b562ba88d4254a32bda77bd1e981a0b312218e9bc8')
b2sums=('2082ffbadad549156c27cdaae06093e0830cecce2defed19b3cefc331589d796bba4d9c3156a8d5864162f42c88bcf733df8f48dc6820ea071583710c67da682'
        'b7bf362e953247424fadea853b3c7be9977021b7d109d240ced847b9271c739e6dfcf8025efbdd9bb746dc42e21905cb1c9c93982d4e39dab60354ab06c6e76a')

prepare() {
  cd "$pkgname"

  # poetry strikes again
  # https://github.com/certbot/josepy/issues/172
  patch -p1 -i "$srcdir/no-thanks-poetry.patch"
}
build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  # install to temporary location
  python -m installer --destdir=test_dir dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="test_dir/$site_packages:$PYTHONPATH" pytest -v \
    -W ignore::DeprecationWarning
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
