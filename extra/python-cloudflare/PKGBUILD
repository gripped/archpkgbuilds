# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-cloudflare
pkgver=2.12.5
pkgrel=4
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
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
)
source=("https://github.com/cloudflare/python-cloudflare/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('11be90eec9df4d761ccbd8fd169462b830f7e7d2705b7cb57a6b58d0b28f5b13a3983e5c6be3e32f1447e22d8f83d29d11660835f2d912a4d8ec24b8072ebb01')

build() {
  cd python-cloudflare-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd python-cloudflare-$pkgver
  python -m installer --destdir=test_dir dist/*.whl
  PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH" pytest tests/test_cloudflare.py
}

package() {
  cd python-cloudflare-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -r "$pkgdir$site_packages"/examples
}

# vim:set ts=2 sw=2 et:
