# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: Kevin Azzam <aur at kevin.azz.am>
# Contributor: Ye Shu <shuye02 at outlook.com>

pkgname=onionshare
pkgver=2.6.3
pkgrel=3
pkgdesc='Share a file over Tor Hidden Services anonymously and securely'
url='https://github.com/onionshare/onionshare'
arch=('any')
license=('GPL-3.0-or-later')
depends=(
  'hicolor-icon-theme'
  'pyside6'
  'python'
  'python-cffi'
  'python-colorama'
  'python-eventlet'
  'python-flask'
  'python-flask-compress'
  'python-flask-socketio'
  'python-gevent'
  'python-gevent-websocket'
  'python-gnupg'
  'python-packaging'
  'python-psutil'
  'python-pynacl'
  'python-pysocks'
  'python-qrcode'
  'python-requests'
  'python-setuptools'
  'python-stem'
  'python-unidecode'
  'python-urllib3'
  'python-waitress'
  'python-werkzeug'
  'tor'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-poetry-core'
  'python-wheel'
)
optdepends=(
  'python-nautilus: enable Nautilus right-click extension'
)
checkdepends=(
  'python-pytest'
)
source=(
  "${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
  "${pkgname}-loosen-cffi-version-bounds.patch"
)
sha512sums=('0ea925230617c303c47fd5558066f8dec58f5d2f920738a7351c83fa2655e7d9fd1433ee0c552d1e8affea6f18cb3d489696d640847129b4082f00fa7481f220'
            '6d4dbaa0ee7073ffae09fec95b7258f40886c87c4a7f85206111727f4cbc73cf6cb2b2c04ba5b5dcca88f8f72aadabe12368f5319fe929db761c6096c9ab614b')
b2sums=('9a6f75f1cf05de3bce9f7847f7cf4146550e45c102ae9f8b193f55825924fe2665925e33709a6137b6da743c4187204607cabdf5f8d559ab5ab044e01b2e22af'
        '7fae57ae4d2afdcae287515770925ff040977be254ab8d5646b3b3b4cd89e5d645a655bfae507455beb3bca15c4a5d1ad6610d548b23a19f897d7c48cac97ede')

prepare() {
  sed -i '/^onionshare-cli = /d' ${pkgname}-${pkgver}/desktop/pyproject.toml
  patch -Np1 -d ${pkgname}-${pkgver} < ${pkgname}-loosen-cffi-version-bounds.patch
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
