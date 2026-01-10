# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>

pkgname=python-immutabledict
pkgver=4.2.1
pkgrel=2
pkgdesc="Immutable wrapper around dictionaries (a fork of frozendict)"
arch=('any')
url=https://github.com/corenting/immutabledict
license=('MIT')
depends=('python')
checkdepends=('python-pytest')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core')
source=("$pkgname-$pkgver.tar.gz::https://github.com/corenting/immutabledict/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('4e8da859dae471bb6865190c7cd9ac0665a5d46be7dc8ca53511f79d4777e35842ba678c102e519e502e002d9f49ddec4e99b5adcb5a00f12f970de0fd1e0329')

build() {
    cd "immutabledict-$pkgver"
    python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
    cd "immutabledict-$pkgver"
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    PATH="$PWD/test-env/bin:$PATH" test-env/bin/python -m pytest
}

package() {
    cd "immutabledict-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
