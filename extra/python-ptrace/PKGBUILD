# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Sebastien Binet <binet@lblbox>

pkgname=python-ptrace
pkgver=0.9.8
pkgrel=5
pkgdesc='Python binding of ptrace library to trace processes and syscalls'
url='https://github.com/vstinner/python-ptrace'
arch=('any')
license=('GPL-2.0-only')
depends=(
  'python'
  'python-six'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-sphinx'
  'python-wheel'
)
source=(
  $url/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz
  $pkgname-0.9.8-imp_removal.patch::$url/commit/80e0c97a84eccb8b82737cf40b9c5581c20c245f.patch
)
sha512sums=('f50ba7d457bf20a161a99913a552f2e829e97975d7cfbf8cf5d89b4f2320772b537678f2e70b9aaa88341c4f01d4bf41f62683e913628db503152f3510a013a3'
            '08b3c8393e308f46bf0b12283d7de79a3b2423dd645663c8025405f96ce12a384ccea7041639a4e62199ce0a0250f2130f3def1e7bf10d4c3173d02cd87f2f0a')
b2sums=('3d387beca9c92c0e3bbd5cf2c9d2af447c233b631e894ce1af2cdc697a1a48e24a299bbc998cd187ac9ad0f45bfc886f476afdb69329d761e8730a047731126b'
        'b2e4db902e3c76317c2c94e9e5d603e6528492181db081c02a8df85b8cbdda17f097bb7521bf37708f9cf51fc712ae1e3ff45231078a7baacae0d5415da70a2e')

prepare() {
  patch -Np1 -d $pkgname-$pkgver -i ../$pkgname-0.9.8-imp_removal.patch
}

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --no-isolation
  make -j1 -C doc man text SPHINXBUILD=sphinx-build
}

check() {
  cd ${pkgname}-${pkgver}
  python runtests.py || echo "Warning: tests only run in an env with ptrace allowed"
}

package() {
  cd ${pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 doc/build/text/*.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
  cp -a examples "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 doc/build/man/${pkgname}.1 -t "${pkgdir}/usr/share/man/man1"
}

# vim: ts=2 sw=2 et:
