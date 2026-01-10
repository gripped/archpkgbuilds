# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-cloudflare
pkgver=2.15.0
pkgrel=2
pkgdesc='Python wrapper for the Cloudflare v4 API'
arch=('any')
license=('MIT')
url='https://github.com/cloudflare/python-cloudflare'
depends=(
  'python-jsonlines'
  'python-requests'
  'python-yaml'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
)
source=("git+https://github.com/cloudflare/python-cloudflare.git#tag=$pkgver")
sha512sums=('2955fc4f9d83847952b496d3a8a8c9eb3f0758188ef89a4b2f5412a8db52ff16e5bad0e52368d714e34a6898e08f03125ed7edf4351fe6d8139074a8ecea7690')

build() {
  cd python-cloudflare
  python -m build --wheel --no-isolation
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd python-cloudflare
  python -m installer --destdir=test_dir dist/*.whl
  PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH" pytest tests/test_cloudflare.py
}

package() {
  cd python-cloudflare
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -r "$pkgdir$site_packages"/{examples,tests}
}

# vim:set ts=2 sw=2 et:
