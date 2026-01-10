# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=rofimoji
pkgver=6.7.0
pkgrel=2
pkgdesc='Emoji, unicode and general character picker for rofi and rofi-likes'
arch=(any)
url=https://github.com/fdw/rofimoji
license=(MIT)
depends=(python-configargparse)
makedepends=(
  git
  python-build
  python-hatchling
  python-installer
)
optdepends=(
  'emoji-font: for the emojis character file'
  'nerd-fonts: for the nerd_font character file'
  'otf-font-awesome: for the fontawesome6 character file'
  'woff2-font-awesome: for the fontawesome6 character file'

  'bemenu: for a generic selector'

  'dmenu: for one of the X.Org selectors'
  'rofi: for one of the X.Org selectors'
  'xclip: for one of the X.Org clipboarders'
  'xsel: for one of the X.Org clipboarders'
  'xdotool: for the X.Org typer'

  'fuzzel: for one of the Wayland selectors'
  'tofi: for one of the Wayland selectors'
  'wmenu: for one of the Wayland selectors'
  'wofi: for one of the Wayland selectors'
  'wl-clipboard: for the Wayland clipboarder'
  'wtype: for one of the Wayland typers'
  'ydotool: for one of the Wayland typers'
)
source=("git+$url.git#tag=$pkgver")
b2sums=('096065b025700adc83b6dba2fa37f196be4042ee819fc33d01e44db6d80116ce8d1ade5704d9b821b69d37d6e724847f2b5c59c6c9e0cc71182f7e1fcff3c412')

prepare() {
  cd $pkgname
  # Remove include list https://github.com/pypa/wheel/issues/92
  sed -i '/^include =/,/]/d' pyproject.toml
}

build() {
  cd $pkgname
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/$pkgname-$pkgver.dist-info/licenses/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname

  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir"/usr/share/man/man1 src/picker/docs/$pkgname.1
}
