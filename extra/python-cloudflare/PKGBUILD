# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-cloudflare
pkgver=2.14.1
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
sha512sums=('86ba039024f17ebd57e4744c65f850cf6352923f554452a3ba6e99bc3850de55457890bca8da899e6e2e3b0cae89de5b82372b7d38d57957e8aa2f66eaa6c1af')

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
