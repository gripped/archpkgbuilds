# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-lazy-object-proxy
pkgver=1.11.0
pkgrel=1
pkgdesc='A fast and thorough lazy object proxy'
arch=('x86_64')
url="https://github.com/ionelmc/python-lazy-object-proxy"
license=('BSD-2-Clause')
depends=("python")
makedepends=('git' 'python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest-benchmark')
source=("git+https://github.com/ionelmc/python-lazy-object-proxy.git#tag=v$pkgver")
sha512sums=('9c7e6fe6d5bf74b498ca4b19c0ff94d1e34c91d3b12f57c513c01f7e7811d6db3d31628de469bf88320e27c9739d4d338e6a434fd6b533865cab22dccaef59b3')

build() {
  cd python-lazy-object-proxy
  python -m build --wheel --no-isolation
}

check() {
  cd python-lazy-object-proxy
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-${python_version}" pytest
}

package() {
  cd python-lazy-object-proxy
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
