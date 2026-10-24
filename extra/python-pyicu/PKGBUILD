# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jonathan Liu <net147@gmail.com>

pkgname=python-pyicu
pkgver=2.17
pkgrel=1
pkgdesc="Python binding for ICU"
arch=('x86_64')
license=('MIT')
url="https://gitlab.pyicu.org/main/pyicu"
depends=('python' 'icu')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-fonttools' 'python-pytest' 'python-six')
source=("git+https://gitlab.pyicu.org/main/pyicu.git#tag=v$pkgver")
sha512sums=('0b73aa632c4e6786cb592ef8ff7b1fe30280c0f7b5ed85a1b26dca269b8d0ea4decc34a635188fda5a591f823e82b7a0270af6151f87c3f614fb72fab6e29831')

build() {
  cd pyicu
  python -m build --wheel --no-isolation
}

check() {
  cd pyicu
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$python_version" pytest
}

package() {
  cd pyicu
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
