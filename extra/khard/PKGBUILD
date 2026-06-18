# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgname=khard
pkgver=0.21.0
pkgrel=1
pkgdesc='Console address book manager'
arch=(any)
url=https://github.com/lucc/khard
license=(GPL-3.0-only)
depends=(
  python
  python-configobj
  python-ruamel-yaml
  python-vobject
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools-scm
#  python-sphinx
#  python-sphinx-argparse
#  python-sphinx-autoapi
  python-wheel
)
checkdepends=('python-pytest')
optdepends=(
  'diffutils: Using sdiff_khard_wrapper.sh'
  'vdirsyncer: Synchronization of address books with a DAV server'
)
source=(
  "git+$url.git#tag=v$pkgver"
)
b2sums=('01c74061e46b93de2c7d862f525d7c4f7d8993d5b27e35999957241b85bbe942aeae89068a20c0e00689e853d5b473d3392b524b40c618efae351f74e68d34d5')

build() {
  cd $pkgname
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build --wheel --skip-dependency-check --no-isolation
  # Disable the man page creation, as it is broken due to sphinx and/or sphinx-argparse
  # https://github.com/lucc/khard/issues/356
  # https://github.com/sphinx-doc/sphinx-argparse/issues/96
  # https://github.com/sphinx-doc/sphinx/issues/14333
  #make -C doc man
}

check() {
  cd $pkgname
  pytest -v
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  # additional wrapper script
  install -vD misc/sdiff/sdiff_${pkgname}_wrapper.sh \
    "$pkgdir"/usr/lib/$pkgname/sdiff_${pkgname}_wrapper.sh
  # twinkle integration
  install -vDm 644 misc/twinkle/scripts/*.py \
    -t "$pkgdir"/usr/share/$pkgname/twinkle/scripts/
  install -vDm 644 misc/twinkle/sounds/*.ogg \
    -t "$pkgdir"/usr/share/$pkgname/twinkle/sounds/
  # zsh
  install -vDm 644 misc/zsh/_*$pkgname \
    -t "$pkgdir"/usr/share/zsh/site-functions/
  # docs
  install -vDm 644 {CHANGES,CONTRIBUTING.rst,README.md} \
    -t "$pkgdir"/usr/share/doc/$pkgname/
  # man
#  install -vDm 644 doc/build/man/$pkgname.1 \
#    -t "$pkgdir"/usr/share/man/man1
#  install -vDm 644 doc/build/man/$pkgname.conf.5 \
#    -t "$pkgdir"/usr/share/man/man5
  install -vDm 644 $pkgname/data/{config.spec,template.yaml} -t "$pkgdir/$site_packages"/$pkgname/data/
}
