# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=python-libarchive-c
pkgver=5.1
pkgrel=5
pkgdesc='Python interface to libarchive'
url='https://github.com/Changaco/python-libarchive-c'
arch=('any')
license=('CC0-1.0')
depends=('python' 'libarchive')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=(https://github.com/Changaco/python-libarchive-c/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz
        libarchive-version-compat.patch)
sha512sums=('ed13687709370a828df584601852af2de9ec93091072242254192e7eb425c754e7d1467eb9692691ce971f2a6c3d5f6ee8c78a21b0262b0cc2c15ae31c03d680'
            '7a7e20c0b0630adcd4d09d6eb447bc65d5002880a0664d9c98c2d513eb4c1dd3352d4ee7357af661180840e8189c5b369f161b04fde6b1325765cf0dac42b0f5')
b2sums=('559c27283615a41fd942be0d1f807b04c1132e78d3283e3e3555542b0baa89bd39269efd24887c3e108265820cacd09755b39b216924205a8de57895dc742303'
        'b11010a3d831618710559447fa675a529e5b951d96e18792b393e912f275bc04059b77d4ff8de233f40e10f53704e2985990d059d0a60109405d1b09da97d9ce')

prepare() {
  sed '/os.umask(2)/d' -i ${pkgbase}-${pkgver}/setup.py
  cd ${pkgbase}-${pkgver}

  # See https://github.com/Changaco/python-libarchive-c/pull/131
  patch -Np1 -i ${srcdir}/libarchive-version-compat.patch
}

check() {
  cd ${pkgbase}-${pkgver}
  LC_CTYPE=en_US.UTF-8 py.test
}

build() {
  cd ${pkgbase}-${pkgver}
  python setup.py build
}

package() {
  cd ${pkgbase}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --skip-build
  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
