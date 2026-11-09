# Maintainer: Giovanni Harting <anonfunc@archlinux.org>
# Contributor: Marius Lindvall <(firstname) {cat} varden {dog} info>

pkgname=jellyfin-mpv-shim
pkgver=3.3.0
pkgrel=2
pkgdesc='Cast media from Jellyfin Mobile and Web apps to MPV'
arch=(any)
url='https://github.com/jellyfin/jellyfin-mpv-shim'
license=('GPL-3.0-or-later AND MIT')
depends=(mpv python hicolor-icon-theme python-mpv python-requests python-mpv-jsonipc python-jellyfin-apiclient python-pillow)
makedepends=(python-build python-installer python-wheel gettext python-setuptools)
optdepends=(
  'python-pystray: systray support'
  'mpv-shim-default-shaders: default shader pack'
  'python-pypresence: Discord Rich Presence integration'
  'python-gobject: MPRIS media controls'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('f68f45133e3dc0ebf66e04b9708b65b839b149189c2b2ae4ce49acfdebf9a7e5396bb0da031db6822f230f77ecfcbe5ad8d4c7af663ad418a3e1cb1869593f1c')

build() {
  cd jellyfin-mpv-shim-$pkgver

  find -iname '*.po' | while read -r _file; do
    msgfmt "$_file" -o "${_file%.*}.mo"
  done

  python -m build --wheel --no-isolation
}

package() {
  cd jellyfin-mpv-shim-$pkgver

  install -Dm644 "LICENSE.md" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  python -m installer --destdir="$pkgdir" dist/*.whl

  for i in 16 32 48 64 128 256; do
    install -Dvm644 jellyfin_mpv_shim/integration/jellyfin-$i.png "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/com.github.iwalton3.jellyfin-mpv-shim.png
  done

  install -Dm644 jellyfin_mpv_shim/integration/com.github.iwalton3.jellyfin-mpv-shim.desktop -t "$pkgdir"/usr/share/applications/
  install -Dm644 jellyfin_mpv_shim/integration/com.github.iwalton3.jellyfin-mpv-shim.appdata.xml -t "$pkgdir"/usr/share/metainfo/

  cd "$pkgdir"
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  ln -s /usr/share/mpv-shim-default-shaders ${site_packages:1}/jellyfin_mpv_shim/default_shader_pack
}

# vim:set ts=2 sw=2 et:
