# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Brett Cornwall <ainola@archlinux.org>

pkgname=tldr
pkgver=3.4.3
pkgrel=3
pkgdesc="Command line client for tldr, a collection of simplified man pages."
arch=('any')
url="https://github.com/tldr-pages/tldr-python-client"
license=('MIT')
depends=('python' 'python-shtab' 'python-colorama' 'python-termcolor')
makedepends=(
    'python-build'
    'python-installer'
    'python-hatchling'
    'python-sphinx-argparse'
)
checkdepends=('python-pytest')
source=("https://github.com/tldr-pages/tldr-python-client/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('9a501ec6b265129de62fd9e0c2cdd46186277f5d7b5e7a54b6f4aaddc5d9e6738424ec10f046c2e669658cd7b2b50ef1767bb982e303e0deb60fb5a43afe6a8d')

build() {
  cd "tldr-python-client-$pkgver"
  make -C docs
  python -m build --wheel --no-isolation
}

check() {
  cd tldr-python-client-$pkgver
  python -m pytest
}

package() {
  cd "tldr-python-client-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"

  # Generate here instead of a .install for package reproducibility
  install -dm755 "$pkgdir/usr/share/bash-completion/completions/"
  install -dm755 "$pkgdir/usr/share/zsh/site-functions/"
  python "$pkgdir"/usr/lib/python*/site-packages/tldr.py --print-completion bash \
    > "$pkgdir/usr/share/bash-completion/completions/tldr"
  python "$pkgdir"/usr/lib/python*/site-packages/tldr.py --print-completion zsh \
    > "$pkgdir/usr/share/zsh/site-functions/_tldr"
}
