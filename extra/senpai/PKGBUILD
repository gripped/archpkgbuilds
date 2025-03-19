# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=senpai
pkgver=0.4.0
pkgrel=1
pkgdesc='A modern terminal IRC client'
arch=('x86_64')
url='https://git.sr.ht/~delthas/senpai'
license=('ISC')
depends=('glibc')
makedepends=('git' 'go' 'scdoc')
options=('!lto')
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('e0ef84cde9beecce10ea14abd8980ea8c1610074507928617060d4db1b8143c01ca65d36aca875416edcea343f28d734ef0d03a951013f5825c2886cde36ef46')
b2sums=('c1181a6b94afc36de54387b87fb3775ba9701723be2ea20ba97d2857313f6ba5504fbd0826054b98cf50c78cf613c919e304d630ae2aa1fc97fdf7cc477c366f')

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
