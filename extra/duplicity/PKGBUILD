# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>

pkgname=duplicity
pkgver=3.0.3
pkgrel=2
pkgdesc='A utility for encrypted, bandwidth-efficient backups using the rsync algorithm'
arch=('x86_64')
url='https://duplicity.gitlab.io/'
license=('GPL-2.0-only')
depends=(
  'gnupg'
  'librsync'
  'python-fasteners'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
)
optdepends=(
  'lftp: backend for ftp, ftps, fish'
  'ncftp: alternative backend for ftp'
  'python-b2sdk: Backblaze B2 backend'
  'python-boto3: Amazon S3 and Google Cloud Storage backend'
  'python-dropbox: Dropbox backend'
  'python-gobject: GIO backend'
  'gvfs: GIO backend'
  'python-paramiko: SSH paramiko backend'
  'python-pexpect: SSH pexpect backend'
  'python-pydrive2: Google Drive backend'
  'python-mediafire: Mediafire backend'
  'python-requests-oauthlib: OneDrive backend'
  'rclone: rclone backend'
  'rsync: rsync backend'
)
source=(
  "$pkgname::git+https://gitlab.com/duplicity/duplicity#tag=rel.$pkgver"
  'fix-documentation-directory.patch'
  'no-pip.patch'
)
sha512sums=('edb488ca178f9c52e4ece4e8b1e0fc3020d3e432b7a6ca61933ec3462939112679a11eb842c1b54671e13ec112770512524fecde8a637d8d9467427d417387ba'
            'fac5f64001f91f65f4b7d8edd5b3dd667ffaf73ceb06102a93f7c4c4bcf898695d62d143ebaf5173fe2a1a797109ecde9cfc8b3779ad1d234d3abb0f1334644e'
            'a308e5eab6fb7a0b3230b379af21fe13b9b4a90bab12c37b642f8dcdd5b616172dcc3900aa4f3a9f7f867239cb39556074beb0d5148ec38df17b2e1a8f0101d7')
b2sums=('2e9a6268d70ef005457f4c2aa9ae76bc06c45dddf423437832a975b37ac88308f370d603307dac58349eece3789615d0a58d7d726f6873df5596e24ae165d3b4'
        '04dad8ce369f4fb78e2b3239e30d63410d8e8c33b5e05717b5b62ba54c624c2e931220b950bad507deab60a07086c434949f0766bc3ae2eb771d62e1919cbecd'
        '8b8d17e127e28bab9a19a0a76c024b862ac84f00a341e4bd2446701ef659d903ddc68b484c7741a03d20e96808bc01d1aa7f52182e3897848eabd8db2459f5a8')

prepare() {
  cd "$pkgname"

  # move documentation to the correct directory
  patch -p1 -i "$srcdir/fix-documentation-directory.patch"

  # do not use pip/pipx
  patch -p1 -i "$srcdir/no-pip.patch"
}

build() {
  cd "$pkgname"

  # FS#76307, FS#79399 - ensure version is correct
  sed -e "s:\$version:$pkgver:" -i "$pkgname/__init__.py"

  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
