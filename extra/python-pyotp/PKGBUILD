# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

pkgname=python-pyotp
_pkgname=pyotp
pkgver=2.12.1
pkgrel=1
pkgdesc='Python library for generating and verifying one-time passwords'
url='https://pyotp.readthedocs.io/'
arch=(any)
license=(MIT)
depends=(python)
makedepends=(
  git
  python-build
  python-installer
  python-hatchling
  python-hatch-vcs
  python-sphinx
  python-guzzle-sphinx-theme
  python-sphinxext-opengraph
)
options=(!makeflags)
source=("git+https://github.com/pyotp/pyotp#tag=v$pkgver")
sha512sums=('6cb6e8ca8de700a4b4119259d1aea0b68ea6206edb8b58020bfb762f17a9e8026ddc13ef5c262282bee40e0b6df75bf4422ef1eb454a8985aebb4b37e6890a19')
b2sums=('17363e2a697db665de6365aeb3db8ef35e2977c42158f8869bb727dcc047f08f3469d077b0efefbae79a27ff6348e0e50f22b554f7a6dbac2c5aa3415a34bce6')

build() {
  cd ${_pkgname}
  python -m build --wheel --skip-dependency-check --no-isolation
  sphinx-build -b text docs docs/_build/text
  sphinx-build -b man docs docs/_build/man
}

check() {
  cd ${_pkgname}
  python -m unittest -v
}

package() {
  cd ${_pkgname}
  python -m installer --destdir="${pkgdir}" dist/*.whl

  # documentation
  install -Dm 644 README.rst ./docs/_build/text/*.txt -t "${pkgdir}/usr/share/doc/${pkgname}"

  # man page
  install -Dm 644 ./docs/_build/man/${_pkgname}.1 -t "${pkgdir}/usr/share/man/man1"
  ln -s /usr/share/man/man1/${_pkgname}.1.gz "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim: ts=2 sw=2 et:
