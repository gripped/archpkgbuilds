# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: eolianoe <eolianoe [at] googlemail [dot] com>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Thomas Weißschuh <thomas t-8ch de>
# Contributor: Étienne Deparis <etienne [at] depar [dot] is>
# Contributor: Max Gautier <mg@max.gautier.name>

pkgname=khal
pkgver=0.14.0
pkgrel=1
pkgdesc='CLI calendar application built around CalDAV'
arch=(any)
url=https://lostpackets.de/khal/
license=(MIT)
depends=(
  python
  python-click
  python-click-log
  python-configobj
  python-dateutil
  python-icalendar
  python-pytz
  python-pyxdg
  python-tzlocal
  python-urwid
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools-scm
  python-sphinx
  python-wheel
)
checkdepends=(
  python-pytest
  python-freezegun
  python-hypothesis
  python-packaging
  vdirsyncer
)
optdepends=(
  'gawk: for mutt2khal'
  'python-setproctitle: to set process name'
  'vdirsyncer: to synchronize CalDAV calendars'
)
source=("git+https://github.com/pimutils/khal.git#tag=v$pkgver")
sha256sums=('f18e3e6b4a95105337c6da6e89040f48fa1ba4e332f1ab9affc793790aaf291f')
b2sums=('69ba072e4b7f375f3c0c39079e3413dff4fd511addcd8e2f7504b665bd1687cb0742c08700256df9533efdeb419b85d9990142b10d73fc14f8a9f472fde65295')

prepare() {
  # avoid makedepends on sphinxfeed-lsaffre
  # (we build only the man page, not HTML docs)
  sed -i "s|\"sphinxfeed\",||" $pkgname/doc/source/conf.py
}

build() {
  cd $pkgname
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build --wheel --skip-dependency-check --no-isolation
  make -C doc man PYTHONPATH="$PWD"
}

check() {
  cd $pkgname
  LC_ALL=C PYTHONPATH=build pytest -v
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  # executables
  install -vDm 755 bin/{i,}$pkgname misc/mutt2khal -t "$pkgdir"/usr/bin/
  # configuration
  install -vDm 644 $pkgname.conf.sample "$pkgdir"/usr/share/doc/$pkgname/examples/$pkgname.conf
  # man page
  install -vDm 644 doc/build/man/$pkgname.1 -t "$pkgdir"/usr/share/man/man1/
  # completions
  install -vd "$pkgdir"/usr/share/{bash-completion/completions,fish/vendor_completions.d,zsh/site-functions}
  PYTHONPATH="$pkgdir/$site_packages:$PYTHONPATH" _KHAL_COMPLETE=bash_source "$pkgdir"/usr/bin/khal > "$pkgdir"/usr/share/bash-completion/completions/$pkgname
  PYTHONPATH="$pkgdir/$site_packages:$PYTHONPATH" _KHAL_COMPLETE=fish_source "$pkgdir"/usr/bin/khal > "$pkgdir"/usr/share/fish/vendor_completions.d/$pkgname.fish
  PYTHONPATH="$pkgdir/$site_packages:$PYTHONPATH" _KHAL_COMPLETE=zsh_source "$pkgdir"/usr/bin/khal > "$pkgdir"/usr/share/zsh/site-functions/_$pkgname
  # desktop file
  install -vDm 644 misc/khal.desktop -t "$pkgdir"/usr/share/applications/
  # docs
  install -vDm 644 {AUTHORS.txt,{CHANGELOG,CONTRIBUTING,README}.rst} -t "$pkgdir"/usr/share/doc/$pkgname/
  # symlink license file
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/$pkgname-$pkgver.dist-info/licenses/doc/source/license.rst "$pkgdir"/usr/share/licenses/$pkgname/license.rst
}
