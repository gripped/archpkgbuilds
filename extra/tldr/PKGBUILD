# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Brett Cornwall <ainola@archlinux.org>

pkgname=tldr
pkgver=3.4.1
pkgrel=1
pkgdesc="Command line client for tldr, a collection of simplified man pages."
arch=('any')
url="https://github.com/tldr-pages/tldr-python-client"
license=('MIT')
depends=('python-shtab' 'python-colorama' 'python-termcolor')
makedepends=(
    'python-build'
    'python-installer'
    'python-hatch'  # Set in pyproject.toml build
    'python-sphinx-argparse'
    'python-wheel'
)
checkdepends=('python-pytest')
source=("https://github.com/tldr-pages/tldr-python-client/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('2ff3839a75fa3a40d45a2c820000826061123bb4a83906c8f2cd055929f4c7661414543511dba36f28451dd28fed13bc32b1467f360274ec60344e03c2ba416b')

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
