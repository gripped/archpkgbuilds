# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-json-logger
pkgver=4.0.0
pkgrel=1
pkgdesc='A python library adding a json log formatter'
arch=('any')
license=('BSD')
url='https://github.com/nhairs/python-json-logger'
depends=('python')
makedepends=('git'
             'python-build'
             'python-installer'
             'python-setuptools')
checkdepends=('python-freezegun'
              'python-pytest')
source=("git+https://github.com/nhairs/python-json-logger.git#tag=v$pkgver")
sha512sums=('1f7106371aec1e508509a52f16fb75446350c83f41942d88bbf9a4b614d862eb14071bbd5d59cc3001b5cb9e6048e9f04532a23353bae53d685702a3f3dbdbc5')

build() {
  cd python-json-logger
  python -m build --wheel --no-isolation
}

check() {
  cd python-json-logger
  PYTHONPATH=src pytest
}

package() {
  cd python-json-logger
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
