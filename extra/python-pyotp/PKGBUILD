# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

pkgname=python-pyotp
_pkgname=pyotp
pkgver=2.9.0
pkgrel=4
pkgdesc='Python library for generating and verifying one-time passwords'
url='https://pyotp.readthedocs.io/'
arch=('any')
license=('MIT')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-sphinx' 'python-guzzle-sphinx-theme' 'python-sphinxext-opengraph')
options=('!makeflags')
source=("git+https://github.com/pyotp/pyotp#tag=v$pkgver?signed"
        "0001-docs-fix-deprecated-intersphinx_mapping-format.patch")
sha512sums=('bf3519fa0ddba2282ea3d0bc5444277bd9f305cf100b372266bf1ae72edab1b6dd13e00acfaf566061bd346aa4dd42e3d738be58f3c401387f0691dffb362b9f'
            '0d716d99844a7d2fad3678b41f951b903c8021c7f322fbd5741f03e4dec2484e9e0d281816341343824f0bb6e903673ee83418a43b0d6d2b23ad0940320716a9')
validpgpkeys=('29BCBADB4ECAAAC2382699388AFAFCD242818A52') # Andrey Kislyuk <kislyuk@gmail.com>

pkgver() {
  cd ${_pkgname}
  git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${_pkgname}
  patch -Np1 -i "${srcdir}/0001-docs-fix-deprecated-intersphinx_mapping-format.patch"
}

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
  install -Dm 644 README.rst ./docs/_build/text/*.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 ./docs/_build/man/${_pkgname}.1 -t "${pkgdir}/usr/share/man/man1"
  ln -s /usr/share/man/man1/${_pkgname}.1.gz "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "${site_packages}/${_pkgname}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
