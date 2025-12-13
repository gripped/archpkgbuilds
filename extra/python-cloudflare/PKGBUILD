# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-cloudflare
pkgver=2.14.3
pkgrel=1
pkgdesc='Python wrapper for the Cloudflare v4 API'
arch=('any')
license=('MIT')
url='https://github.com/cloudflare/python-cloudflare'
depends=(
  'python-beautifulsoup4'
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
sha512sums=('365628bd6038c89e1aab4b483a1f479922f34e329271c39f922437155c1a412ff1d1f54b42155cbeeaa4ac7da0215dd5babd46a35a88dfc9527432062452f856')

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
  rm -r "$pkgdir$site_packages"/examples
}

# vim:set ts=2 sw=2 et:
