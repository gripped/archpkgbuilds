# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: eric <eric@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
 
pkgname=psutils
pkgver=3.3.16
pkgrel=1
pkgdesc='A set of postscript utilities'
arch=(any)
url="https://github.com/rrthomas/$pkgname"
license=(GPL-3.0-only)
depends=(libpaper
         python
         python-puremagic
         python-pypdf)
makedepends=(python-{build,installer,wheel}
             python-argparse-manpage
             python-setuptools)
checkdepends=(ghostscript
              python-pytest-datafiles
              python-wand)
_archive="$pkgname-$pkgver"
source=("$url/releases/download/v$pkgver/$_archive.tar.gz")
sha256sums=('d259da9bc95395fe9761b289333e83866ecbf2d43ee844e74a14a3f74ff2808b')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	export PYTHONPATH="."
	pytest
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" COPYING
}
