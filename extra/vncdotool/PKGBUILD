# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
pkgname=vncdotool
pkgver=1.4.1
pkgrel=1
pkgdesc='A command line VNC client'
arch=('any')
url='https://github.com/sibson/vncdotool'
license=('MIT')
depends=('python-pillow' 'python-twisted' 'python-pycryptodomex')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=($pkgname-$pkgver.tar.gz::https://github.com/sibson/vncdotool/archive/v$pkgver.tar.gz)
sha512sums=('58690ddeb90c83813cea0f0b7bf169c98cb4d25ea7fcd0c6d2a525cf27692a8f32020b6beb9df660086bfd453a1fdf5bd38f04f4c0cbdda389850abd3b0fb39f')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver

    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
