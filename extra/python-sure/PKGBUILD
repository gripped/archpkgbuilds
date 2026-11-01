# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-sure
pkgver=2.0.1
_commit=84a45bf91fde2e4b922fb126a9f45651be9393fb
pkgrel=8
pkgdesc="An idiomatic testing library for python with powerful and flexible assertions"
arch=('any')
url="https://github.com/gabrielfalcao/sure"
license=('GPL-3.0-or-later')
depends=('python-six')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest')
source=("git+https://github.com/gabrielfalcao/sure.git#commit=$_commit"
        "use-unittest-mock.diff"
         python-3.14.patch
         python-sure-2.0.1-pytest.patch)
sha512sums=('afe1fd4698f7386d40c0a138fb3d3e824549669bfb74b97f336743b7f25278302ab0cb45fb4b8ee18b5709895c623bd885896b984a131c51d7c899113a44b073'
            'ad17f0bc171058cc488f844a55bd0cf2f83b391c6c47b4ac1864b5de0d0842eb086dd1413c249a05684a45c67542c15eadfa2a7cdff095669e327d0e80f09183'
            '7fd64564513a56caf2d6041763bc6ce593ecb3a35364e6f1d174931d3d8d44197b0360b5e73dc63377aca28e6a49e253c9a91c305b80a8171f253534549820be'
            'dc4602846a5e34c24fd4c338219cf5a0a4f0b048d22e1bee51c63cdc429bfd5ea30f71cced6c2ce5b5ecbdbdf78ef93cd909feba815ae85b8065c5f0313f1f69')

prepare() {
  export LC_CTYPE=en_US.UTF-8

  cd sure
  # Based on the first two commits in https://github.com/gabrielfalcao/sure/pull/161
  patch -Np1 -i ../use-unittest-mock.diff

  sed -i 's#--cov=sure##' setup.cfg

  patch -p1 -i ../python-3.14.patch
  patch -p1 -i ../python-sure-2.0.1-pytest.patch
}

build() {
  cd sure
  python -m build --wheel --no-isolation
}

check() {
  cd sure
  PYTHONPATH="$PWD" pytest
}

package() {
  cd sure
  python -m installer --destdir="$pkgdir" dist/*.whl
}
