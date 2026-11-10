# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pytest-vcr
pkgname=python-pytest-vcr
pkgver=1.0.2
pkgrel=11
pkgdesc="Py.test plugin for managing VCR.py cassettes"
arch=('any')
url="https://github.com/ktosiek/pytest-vcr"
license=('MIT')
depends=('python-pytest' 'python-vcrpy')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-coverage' 'python-pytest')
# the pypi sdist for 1.0.2 doesn't have the tests (yet)
# https://github.com/ktosiek/pytest-vcr/issues/26
# source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
source=("${_name}-${pkgver}.tar.gz::https://github.com/ktosiek/${_name}/archive/${pkgver}.tar.gz"
        print-vcr-mode-values.patch)
sha512sums=('29dceb51092d73f2190b89e82e88b59506591a35cfe4f141bb877c05420d67a8ab2f21f63c2630972c35697d01b242891917d1be19b14fdfa810c1799f8542c2'
            'dc80636e034a832c2cf97815cae731d591d03c2aba087c83fc795b4cbf7d9387e8e7c10a899a710312dbdd57b270543cb74dac36cf4a7b3479913b0e0ff4ec0a')

prepare() {
  mv -v "${_name}-${pkgver}" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  sed -e '/pytest.config/d' -i tests/test_vcr.py
  # https://github.com/ktosiek/pytest-vcr/pull/56
  patch -p1 -i "$srcdir"/print-vcr-mode-values.patch
}

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  # Hack entry points by installing it
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -vDm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
