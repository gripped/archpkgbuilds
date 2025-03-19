# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Jelle van der Waa <jelle@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-validate-pyproject
pkgver=0.24
pkgrel=1
pkgdesc="Validation library and CLI tool for checking on 'pyproject.toml' files using JSON Schema"
url="https://github.com/abravalheri/validate-pyproject"
license=('MPL-2.0')
arch=('any')
depends=('python' 'python-fastjsonschema' 'python-packaging' 'python-trove-classifiers')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
checkdepends=('python-pytest')
source=("git+$url.git#tag=v$pkgver")
sha512sums=('e32cc021778e50166f7b53b9a5d65f82746db61055d82c0a37320f7c3555a82244ae585252172f4c50989e17d7390d743242940fd4bbd21b87b7a739cba57de3')

build() {
  cd ${pkgname#python-}
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest --override-ini="addopts="
}

package() {
  cd ${pkgname#python-}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
