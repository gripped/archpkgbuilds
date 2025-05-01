# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=senpai
pkgver=0.4.1
pkgrel=1
pkgdesc='A modern terminal IRC client'
arch=('x86_64')
url='https://git.sr.ht/~delthas/senpai'
license=('ISC')
depends=('glibc')
makedepends=('git' 'go' 'scdoc')
options=('!lto')
source=("git+$url#tag=v$pkgver")
sha512sums=('5f2febdce807a32cd5a1cc8c7804965ac3143972bde81d24d05ff09c94c0495026299afaeab3facf1058229883c9171319f718bc43401292f89b4ddc6a6a0324')
b2sums=('2ee7a0db42b4b5ddeec7a7fa5172b1ef07424106519cb8483a240b132488ced9b3ca05ec32dd51ec24fd945a0aa39f79998de830c3bf6ebaf7ac9381d541d04e')

prepare() {
  cd "$pkgname"

  # download dependencies
  export GOPATH="${srcdir}"
  go mod download
}

build() {
  cd "$pkgname"

  # set Go flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOPATH="${srcdir}"

  go build -v \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-compressdwarf=false \
    -linkmode external \
    -extldflags '${LDFLAGS}'" \
    ./cmd/senpai

  # documentation
  make doc/senpai.{1,5}

  # ensure reproducibility of man pages
  # i'm not 100% sure where the man sub-command gets the date from, i assume
  # it uses $TODAYS_DATE, so this should make the man page reproducible
  local _commit_date=$(git show --no-patch --format=%cd --date=format:%Y-%m-%d)
  sed \
    -i doc/*.{1,5} \
    -e "s/\"[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}\"/\"$_commit_date\"/"
}

check() {
  cd "$pkgname"

  go test -v ./...
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir" PREFIX=/usr install

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
