# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: Kevin Azzam <aur at kevin.azz.am>
# Contributor: Ye Shu <shuye02 at outlook.com>

pkgname=onionshare
pkgver=2.6.1
pkgrel=1
pkgdesc='Share a file over Tor Hidden Services anonymously and securely'
url='https://github.com/onionshare/onionshare'
arch=('any')
license=('GPL-3.0-only')
depends=(
  'hicolor-icon-theme'
  'pyside6'
  'python'
  'python-colorama'
  'python-flask'
  'python-flask-compress'
  'python-flask-socketio'
  'python-packaging'
  'python-psutil'
  'python-pynacl'
  'python-pysocks'
  'python-qrcode'
  'python-requests'
  'python-setuptools'
  'python-unidecode'
  'python-waitress'
  'python-werkzeug'
  'stem'
  'tor'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-poetry'
  'python-wheel'
)
optdepends=(
  'python-nautilus: enable Nautilus right-click extension'
)
checkdepends=(
  'python-pytest'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/onionshare/onionshare/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('ffc3da4e2ae4231bab3992221f4fb92c0568919a92e5ab39d9c2f14cdeff557955d687c86695b340444cf9ba352f5764601299ef5fb0d1e4ecff86883e6ab839')
b2sums=('add7235e2bbd3773c1d6efa508c0d5a7cf137d36adab560f3f32ffb54e9ade00d9fe19f97e36f0bf759f47a51420cf12035a8ad1e2970e440e1033e378382cf6')

prepare() {
  sed -i '/^onionshare-cli = /d' ${pkgname}-${pkgver}/desktop/pyproject.toml
}

build() {
  cd ${pkgname}-${pkgver}/cli
  python -m build --wheel --no-isolation
  cd ../desktop
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname}-${pkgver}
  pushd cli
  PYTHONPATH=".:${PYTHONPATH}" pytest tests/
  popd
  pushd desktop
  #PYTHONPATH="src:../cli:${PYTHONPATH}" pytest tests/
}

package() {
  cd ${pkgname}-${pkgver}
  python -m installer --destdir="${pkgdir}" cli/dist/*.whl
  python -m installer --destdir="${pkgdir}" desktop/dist/*.whl

  install -Dm 644 desktop/org.onionshare.OnionShare.desktop -t "${pkgdir}/usr/share/applications/"
  install -Dm 644 desktop/org.onionshare.OnionShare.svg -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
  install -Dm 644 desktop/org.onionshare.OnionShare.appdata.xml -t "${pkgdir}/usr/share/metainfo/"
}

# vim: ts=2 sw=2 et:
