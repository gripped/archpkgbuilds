# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Storm Dragon <stormdragon2976@gmail.com>

pkgname=magic-wormhole
pkgver=0.22.0
pkgrel=1
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
         python-qrcode
         python-service-identity
         python-spake2
         python-tqdm
         python-txtorcon
         python-zipstream-ng)
makedepends=(python-{build,installer,wheel}
             python-setuptools
             python-versioneer)
checkdepends=(python-magic-wormhole-mailbox-server
              python-magic-wormhole-transit-relay
              python-noiseprotocol
              python-pytest
              python-pytest-mock
              python-pytest-twisted
              python-hypothesis)
_archive="$pkgname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha512sums=('cfef9462f41ec1569d5ce986d190d94fa56b13e84bff7acce99818376c66e3db9a31e5051578780293e7d716e88219ea3ddca5ebe1bf3c52a3d6c946d93ac127')

prepare() {
	cd "${pkgname#python-}-$pkgver"
	# vendored versioneer is too old for Python 3.12
	rm -f versioneer.py
}

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	export PYTHONPATH=src
	local deselected=(
		# uses unittest.mock wrong and triggers Python errors
		src/wormhole/test/test_tor_manager.py
		# use network connections via twisted with flakey race conditions
		src/wormhole/test/test_args.py
		src/wormhole/test/test_cli.py
	)
	pytest ${deselected[@]/#/--deselect }
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -vDm 644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	install -vDm 644 -t "$pkgdir/usr/share/man/man1/" docs/wormhole.1
	mkdir -p "$pkgdir/usr/share/"{bash-completion/completions,fish/vendor_completions.d,zsh/site-functions}/
	mv "$pkgdir/usr/"{wormhole_complete.bash,share/bash-completion/completions/wormhole}
	mv "$pkgdir/usr/"{wormhole_complete.fish,share/fish/vendor_completions.d/wormhole.fish}
	mv "$pkgdir/usr/"{wormhole_complete.zsh,share/zsh/site-functions/_wormhole}
}
