# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-update-checker
pkgver=1.0.1
pkgrel=1
pkgdesc="A python module that will check for package updates"
arch=('any')
license=('BSD-2-Clause')
url='https://github.com/bboe/update_checker'
depends=('python')
provides=('python-update_checker')
conflicts=('python-update_checker')
replaces=('python-update_checker')
makedepends=('git' 'python-build' 'python-installer' 'python-uv-build')
checkdepends=('python-aiohttp' 'python-pytest' 'python-pytest-asyncio')
optdepends=('python-aiohttp: async API support')
source=("git+https://github.com/bboe/update_checker.git#tag=v$pkgver")
sha512sums=('92ec3f1034b5c67dca341e1a32ee5a2d5941fb7d749b73df2449434ef7e6f3c6914bf6a30b8681eb13f3a336ed77c5bb46d694822b409b618c188534fb1a49d9')

build() {
  cd update_checker
  python -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd update_checker
  python -m installer --destdir=test_dir dist/*.whl
  PYTHONPATH="$PWD/test_dir/$_site_packages" pytest
}

package() {
  cd update_checker
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
