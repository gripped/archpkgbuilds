# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-configupdater
pkgver=4.0.1
pkgrel=1
pkgdesc="Parser like ConfigParser but for updating configuration files"
url="https://github.com/pyscaffold/configupdater"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('git' 'python-hatchling' 'python-hatch-vcs' 'python-build' 'python-installer')
checkdepends=('python-pytest')
source=("git+https://github.com/pyscaffold/configupdater.git#tag=v$pkgver")
sha512sums=('ebaf862a06f05bcf3c8ef731ba9ad82099b944d22d4f80f730f2a903799082041d2be2d50441d7048f70c0a06697397a1dc60edb92a2024003d9d52fb42ae119')

build() {
  cd configupdater
  python -m build --wheel --no-isolation
}

check() {
  cd configupdater
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd configupdater
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
