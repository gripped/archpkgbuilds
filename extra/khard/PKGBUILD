# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=khard
pkgver=0.20.1
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
  python-sphinx
  python-sphinx-argparse
  python-sphinx-autoapi
  python-sphinx-autodoc-typehints
  python-wheel
)
checkdepends=('python-pytest')
optdepends=(
  'diffutils: Using sdiff_khard_wrapper.sh'
  'vdirsyncer: Synchronization of address books with a DAV server'
)
source=("git+$url.git#tag=v$pkgver")
b2sums=('523746369a89743b3a30f9c8f18a122c49adeb0ce54a2bb597a075c21de48817e2a638a8895b0846c304a70a09ad571a2aadd8d5be72ef4816daea44eb208542')

build() {
  cd $pkgname
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build --wheel --skip-dependency-check --no-isolation
  make -C doc man
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
  install -vDm 644 doc/build/man/$pkgname.1 \
    -t "$pkgdir"/usr/share/man/man1
  install -vDm 644 doc/build/man/$pkgname.conf.5 \
    -t "$pkgdir"/usr/share/man/man5
  install -vDm 644 $pkgname/data/{config.spec,template.yaml} -t "$pkgdir/$site_packages"/$pkgname/data/
}
