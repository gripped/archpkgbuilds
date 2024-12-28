# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Storm Dragon <stormdragon2976@gmail.com>

pkgname=magic-wormhole
pkgver=0.17.0
pkgrel=3
pkgdesc="Securely transfer data between computers"
arch=(any)
url="https://github.com/magic-wormhole/magic-wormhole"
license=(MIT)
depends=(python-autobahn
         python-click
         python-humanize
         python-idna
         python-iterable-io
         python-pynacl
         python-pyopenssl
         python-service-identity
         python-spake2
         python-tqdm
         python-txtorcon
         python-zipstream-ng)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
checkdepends=(python-magic-wormhole-mailbox-server
              python-magic-wormhole-transit-relay
              python-noiseprotocol
              python-pytest
              python-pytest-mock)
_archive="$pkgname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha512sums=('098688f42bb16f71c24f3e3aefa39166b3f4250955359cb9c90d125e2e261a95bf180296e00e9d656f43817dc6c9b2e54ce3d2c222fdad4198ac7e005814ecf7')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	export PYTHONPATH=src
	local deselected=(
		# uses unittest.mock wrong and triggers new Python's errors
		src/wormhole/test/test_tor_manager.py
	)
	pytest ${deselected[@]/#/--deselect }
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -vDm 644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	install -vDm 644 -t "$pkgdir/usr/share/man/man1/" docs/wormhole.1
	mkdir -p "$pkgdir/usr/share/"{bash_completion/completions,fish/vendor_completions.d,zsh/site-functions}/
	mv "$pkgdir/usr/"{wormhole_complete.bash,share/bash_completion/completions/wormhole}
	mv "$pkgdir/usr/"{wormhole_complete.fish,share/fish/vendor_completions.d/wormhole.fish}
	mv "$pkgdir/usr/"{wormhole_complete.zsh,share/zsh/site-functions/_wormhole}
}
