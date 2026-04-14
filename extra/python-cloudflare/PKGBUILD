# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-cloudflare
pkgver=2.19.0
pkgrel=1
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
sha512sums=('4faa9be231850eec9947a2920454da9e53c3434a6f150b0e1c90fcc19f2b608ad0e9c3ca4a86192010e5a3058276459611270048b2a87bc8955d9826f9cfcd7b')

build() {
  cd python-cloudflare
  python -m build --wheel --no-isolation
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd python-cloudflare
  python -m installer --destdir=test_dir dist/*.whl
  PYTHONPATH="test_dir$site_packages:$PYTHONPATH" pytest CloudFlare/tests/test_cloudflare.py
}

package() {
  cd python-cloudflare
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -r "$pkgdir$site_packages"/examples
}

# vim:set ts=2 sw=2 et:
