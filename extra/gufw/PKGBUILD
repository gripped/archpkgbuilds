# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor : Martin Wimpress <code@flexion.org>

pkgname=gufw
pkgver=24.04
pkgrel=4
pkgdesc='Uncomplicated way to manage your Linux firewall'
url='https://costales.github.io/projects/gufw/'
arch=('any')
license=('GPL3')
depends=('gtk3' 'polkit' 'python' 'python-gobject' 'ufw' 'webkit2gtk-4.1'
         'desktop-file-utils' 'gtk-update-icon-cache')
makedepends=('git' 'intltool' 'python-distutils-extra' 'python-setuptools')
source=(git+https://github.com/costales/gufw.git#tag=${pkgver})
sha512sums=('aaf8b173ffb8b9e60afd3e42bbf327606e2cd7c222486e75744cf2df638c609ae86f18a72e7e1c2a78847ad05324028943de63281dd659831aac9119f8187826')
b2sums=('cc2e61a61808c38350abe109346b8a92319c4ab9407cb65056a7ff9a62cd8403a6b79ce34f0038424a1eccfcb120564da5595745f87bb47e317c7a57f65a429d')

prepare () {
  cd ${pkgname}

  # Switch from webkit2gtk 4.0 to 4.1
  git cherry-pick -n 46b62003dc15dbaba96f3880739ac951145be5a8

  local PYTHONVERSION="$(python -c 'import sys; print("{}.{}".format(sys.version_info.major, sys.version_info.minor))')"
  sed 's|/usr/share/gufw/gufw/gufw.py $1|/usr/lib/python'"${PYTHONVERSION}"'/site-packages/gufw/gufw.py "$@"|' -i bin/gufw-pkexec
}

build() {
  cd ${pkgname}
  python setup.py build
}

package() {
  cd ${pkgname}
  # required so desktop, icon and translation files get installed
  export XDG_RUNTIME_DIR="$(mktemp -d --tmpdir gufw-build-XXXXXXXXX)"
  python setup.py install --prefix=/usr --root="${pkgdir}" -O1
}

# vim: ts=2 sw=2 et:
