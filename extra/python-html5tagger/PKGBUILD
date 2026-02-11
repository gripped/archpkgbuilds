# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-html5tagger
pkgver=1.3.0
_commit=ef9e01b38f5bd064f3f8d061632df7937c0ae738
pkgrel=5
pkgdesc='Pythonic HTML generation/templating (no template files)'
arch=("any")
url='https://github.com/sanic-org/html5tagger'
license=(MIT)
depends=(python)
makedepends=(git python-build python-installer python-setuptools python-setuptools-scm python-wheel)
source=("git+https://github.com/sanic-org/html5tagger#commit=$_commit")
sha256sums=('40b6fa26cfddba4c0abab28cb03efa898acdeab120948be4170e812a63903eab')

build() {
    cd html5tagger
    python -m build --wheel --no-isolation
}

package() {
    cd html5tagger
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
