# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>

pkgname=duplicity
pkgver=3.0.6.1
pkgrel=1
pkgdesc='A utility for encrypted, bandwidth-efficient backups using the rsync algorithm'
arch=(x86_64)
url='https://duplicity.gitlab.io/'
license=(GPL-2.0-only)
depends=(
  gnupg
  librsync
  python-fasteners
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
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
  fix-documentation-directory.patch
  no-pip.patch
)
sha512sums=('cf7286581dbc6d847e42edd822db7ab3deeea913eddc3772733bdf66ced4bb20f6f1c8448c461bbd5aafe935c764f5c692cd3686f05522fd7d6c97db5877969a'
            'fac5f64001f91f65f4b7d8edd5b3dd667ffaf73ceb06102a93f7c4c4bcf898695d62d143ebaf5173fe2a1a797109ecde9cfc8b3779ad1d234d3abb0f1334644e'
            'c7b94e6c9a5d9ffe57c69ff2db90a278936c6187c0342762c0589616ee35745495bce14bc4b8da903f1ef1baf329a71f6839e826f25a813cfa8eb91a87fecafc')
b2sums=('47881d4c0cdba856af01034abf5a1fe84901e6676f7928ac62e89e4c5948903328ba9114a0c0af61dda13dfba08a4e613d54a78c7d211b1cd6831474597040db'
        '04dad8ce369f4fb78e2b3239e30d63410d8e8c33b5e05717b5b62ba54c624c2e931220b950bad507deab60a07086c434949f0766bc3ae2eb771d62e1919cbecd'
        'cc40b852f4546b945fdc7687d900a49187597f8eaf5a843e0ac1556039f9e9daba83443297aca47eb8dce95b54d0e052b07cec31cc0e9982324ce892af3f0c20')

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
