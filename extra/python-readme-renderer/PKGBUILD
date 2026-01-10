# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-readme-renderer
pkgver=44.0
pkgrel=3
pkgdesc="Safely render long_description/README files in Warehouse"
url="https://github.com/pypa/readme_renderer"
license=('Apache')
arch=('any')
depends=('python-docutils' 'python-pygments' 'python-nh3')
optdepends=('python-cmarkgfm: for Markdown support')
makedepends=('python-cmarkgfm' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest')
source=(https://github.com/pypa/readme_renderer/archive/$pkgver/$pkgname-$pkgver.tar.gz
        https://github.com/pypa/readme_renderer/commit/04d5cfe7.patch
        https://github.com/pypa/readme_renderer/commit/d047a297.patch)
sha512sums=('d5c0bcfeff30d3460ac7dc7ad6a5a487c1b3d8c3621e929ddc37493f400903471d2b3b017c176414e63c0919c70de2a9fafbf99357f45d0e92198748de772d92'
            'af3babca7c134f8fbde489e0fb22a7f9ea291f39e3519149bc9acc5b46fa2c37998b2f695f6b61e3b9c6338da03289c5dd6c190a801f9def16f5ae57bde6663a'
            '5c64ffad855382a5b5e9c9894c91c992d57bcd0a52e7cc8ae52895dc0e3191ab205c2755c14c5aceb2ca881844e7af6d5517b325b73de64420a7f24f1eae44e5')

prepare() {
  cd readme_renderer-$pkgver
  patch -p1 -i ../d047a297.patch # Fix tests with docutils 0.22
  patch -p1 -i ../04d5cfe7.patch # Fix tests
}

build() {
  cd readme_renderer-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd readme_renderer-$pkgver
  pytest -v
}

package() {
  cd readme_renderer-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
