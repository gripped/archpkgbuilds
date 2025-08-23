# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=ruby-chef-utils
_pkgname="${pkgname#ruby-}"
pkgver=19.1.68
pkgrel=1
pkgdesc='Basic utility functions for Core Chef Infra development'
arch=('any')
url='https://github.com/chef/chef'
license=('Apache-2.0')
depends=('ruby' 'ruby-concurrent')
makedepends=('git' 'ruby-rdoc' 'ruby-rake' 'ruby-bundler')
options=('!emptydirs')
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('1edb44bec4d776e1d0fe18431140ba79898fbc808c04d74afb9987ef1b8bb00dcfc58ebf4fcfc602d46812505c1b208512f36b28d08805486916a79bfe2ff044')
b2sums=('08fd4a9fc51e1b86bd1b0f5ce96376b6f6706c8be2d36f209d3e048e956fd5986f44f71162153015bd784306a64deec0954720ae9417bf9faa9b6cb12c83932e')

build() {
  cd "$pkgname/$_pkgname"

  rake build
}

package() {
  cd "$pkgname/$_pkgname"

  local _gemdir="$(gem env gemdir)"

  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "$pkgdir/$_gemdir" \
    --bindir "$pkgdir/usr/bin" \
    "pkg/$_pkgname-$pkgver.gem"

  # delete cache
  rm -rf "$pkgdir/$_gemdir/cache"

  # license
  install -vd "$pkgdir/usr/share/licenses/$pkgname"
  ln -sf "$_gemdir/gems/$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
