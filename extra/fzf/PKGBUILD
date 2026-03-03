# Maintainer: Thore Bödecker <foxxx0@archlinux.org>
# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>
# Contributor: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: Hermann Zahnweh (eigengrau)
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: foalsrock <foalsrock at gmail dot-com>
# Contributor: jebaum <jebaum at ucla dot edu>

pkgname=fzf
pkgver=0.70.0
pkgrel=1
pkgdesc='Command-line fuzzy finder'
arch=('x86_64')
url='https://github.com/junegunn/fzf'
license=('MIT')
depends=('bash')
makedepends=('git' 'go')
optdepends=('fish: fish keybindings'
            'tmux: fzf-tmux script for launching fzf in a tmux pane'
            'vim: plugin'
            'zsh: zsh keybindings')
options=(!lto)
source=("git+https://github.com/junegunn/fzf.git#tag=v${pkgver}?signed")
validpgpkeys=('23F9CCD32FBC4A8D4E822AB8D9770615D226D94C') # Junegunn Choi <junegunn.c@gmail.com>
sha512sums=('c051a7a7ac198451f85b27b9469caf579d1ecfd9403c6bae1118a73f58a49a19f1b8cf5a8389e572ea86b1d7238c39f31f9216f3d34faa4e512e5b277227837d')

prepare() {
	cd "${pkgname}"
	sed -i 's/-w /-w -linkmode external /' Makefile
}

build() {
	cd "${pkgname}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	make
        make bin/fzf
}

check() {
	cd "${pkgname}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go test ./...
}

package() {
	cd "${pkgname}"

	## Man page
	install -Dm644 man/man1/fzf.1 "$pkgdir"/usr/share/man/man1/fzf.1
	install -Dm644 man/man1/fzf-tmux.1 "$pkgdir"/usr/share/man/man1/fzf-tmux.1

	## License
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/fzf/LICENSE

	## Binaries
	install -dm755 "$pkgdir"/usr/bin
	install -m755 bin/fzf-tmux "$pkgdir"/usr/bin/
	install -m755 bin/fzf "$pkgdir"/usr/bin/

	## Completion and keybindings
	install -dm755 "$pkgdir"/usr/share/fzf
	install -m644 shell/*.bash shell/*.zsh "$pkgdir"/usr/share/fzf
	install -m755 bin/fzf-preview.sh "$pkgdir"/usr/share/fzf/fzf-preview.sh

	## Fish keybindings
	install -Dm644 shell/key-bindings.fish "$pkgdir"/usr/share/fish/vendor_functions.d/fzf_key_bindings.fish

	## Vim plugin
	install -Dm644 doc/fzf.txt "$pkgdir"/usr/share/vim/vimfiles/doc/fzf.txt
	install -Dm644 plugin/fzf.vim "$pkgdir"/usr/share/vim/vimfiles/plugin/fzf.vim
}

