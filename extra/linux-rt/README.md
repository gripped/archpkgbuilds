# linux-rt

These are the package build sources for the Linux kernel with [PREEMPT_RT patches] applied (see [realtime kernel]).

The Arch Linux specific patches are developed/rebased/applied on top of releases of the real-time Linux project in the [source repository] and are maintained by Arch Linux package maintainers.

## Package sources

The sources for this package are retrieved from two separate upstreams:

- the <https://kernel.org> release of the targeted Linux kernel version
- the [source repository] release, which contains the [PREEMPT_RT patches] and the distribution patches

---
Note: While retrieving upstream sources from a single location is in theory possible with `git` sources, this is unfortunately very slow (the kernel git repository is *very big*).

---

## Source repository

The function of the [source repository] is to

- create a unified location for the download of [PREEMPT_RT patches] and the distribution patches using forge releases
- rebase [PREEMPT_RT patches] on top of newer patch-level versions of the Linux kernel (if possible)
- rebase/cherry-pick distribution patches on top of [PREEMPT_RT patches]

To enable this, the tags of the [upstream repository] and [distribution repository] must be fetched when working with the repository locally.
This package source repository contains tooling to help in maintaining the [source repository].

Make sure to install the [`just`] package and use the following to gain an overview of the available recipes:

```bash
just
```

### Releases

Releases are created for custom tags which contain the [PREEMPT_RT patches] and commits specific to the Arch Linux distribution.

Tags are of the form `vX.Y.Z-rtR-archA`, where `X`, `Y` and `Z` represent the upstream Linux kernel major, minor and patch level version (respectively), `R` represents the real-time kernel patch version applied/rebased on top of the upstream Linux kernel version and `A` represents the version of the Arch Linux specific patches applied/rebased on top of the union of upstream Linux kernel and real-time kernel versions.

A forge release is accompanied by several file downloads:

- a (compressed) patch for the [PREEMPT_RT patches], plus [detached OpenPGP signature]
- a (compressed) patch for the distribution changes, plus [detached OpenPGP signature]

### Setup source repository

Use the following to clone the upstream sources and set them up:

```bash
just setup-sources
```

---
Note: By default, the [source repository] is cloned in a pre-defined, per-user location, which can be overriden using the `source_dir` variable (see [setting variables from the command line] for further information).

---

### Fetch updates for sources

Use the following to fetch updates of the git remotes, which are setup for the [source repository]:

```bash
just fetch-sources
```

### Work with source repository

A dedicated [`just`] recipe allows for directly working on the local clone of the [source repository] using `git`:

```bash
just git
```

Alternatively, go to the directory, to work on the [source repository] directly:

```bash
cd "$(just get-source-dir)"
```

### Configure source repository

In case your default git configuration does not contain the correct user configuration, you will need to set it up once accordingly!

```bash
just git config --local user.name "John Doe"
just git config --local user.email "john@example.org"
just git config --local signingKey "f1d2d2f924e986ac86fdf7b36c94bcdf32beec15"
```

## Package maintainer information

In case you want to co-maintain this package, please make sure to request to be added as developer to the [source repository] by opening a ticket about this in <https://gitlab.archlinux.org/archlinux/infrastructure/-/work_items>.

---
Note: The workflow for releasing new versions of this package is somewhat involved.
      The upstream for the [PREEMPT_RT patches] does not create releases (rebased versions of the patch set) for each patch level release of the kernel.
      As such, we are rebasing/cherry-picking distribution-specific commits on top of their initial patch set release for a kernel major/minor version.
      Afterwards, we are taking the upstream patch set and rebase it on top of newer kernel patch level releases (on a best effort basis), until a new version of the upstream patch set is released.

---

### Rebase real-time patches on top of later version of the kernel

---
Note: The [PREEMPT_RT patches] are often only made available for an initial version and/or a few intermediate patch-level releases of a kernel release series.
      To stay up-to-date and be able to rely on security patches and general fixes of the upstream kernel, it is necessary to rebase the patch set on top of more current kernel releases.
      Due to the size of the patch set, rebasing happens on a best effort basis.

---

To checkout the [PREEMPT_RT patches] of an earlier kernel release and rebase them on top of a newer kernel release, use the following:

```bash
just git checkout vX.Y.1-rtR-rebase
just git rebase -S -i vX.Y.2
```

### Tag a custom real-time version

After successfully rebasing the [PREEMPT_RT patches] on top of a newer kernel version, we have to tag our own version (which does not conflict with the versioning scheme of upstream):

```bash
just tag-rt
```

### Cherry-pick relevant distribution patches

Most patches chosen for the default kernel package should usually also be applied to other kernels.

Cherry-picks of distribution patches must only be added on top of a tagged (by upstream or us) version of the [PREEMPT_RT patches]!

```bash
just git cherry-pick -S e242ed3bffccdf271b7fbaf34ed72d089537b42f
```

---
Note: The default kernel patch adjusting `EXTRAVERSION` in the kernel `Makefile` should _not_ be included, as it differs for this kernel package.
      Instead, cherry-pick the relevant commit from a previous [source repository] release of this package and adjust it.

---

### Rebasing distribution patches

If the distribution patches did not change between kernels releases it is faster to rebase them, instead of cherry-picking them (see above).
For this go to the previous release tag and rebase it on top of the new project tag, e.g.:

```bash
just git checkout vX.Y.2-rtR-archA
just git rebase -S -i vX.Y.3-rtR-rebase
```

### Creating a release

Releases for the [source repository] can be created, once [PREEMPT_RT patches] have been applied and tagged and all relevant distribution patches have been added.

```bash
just release
```

This will automatically create a new tag in the [source repository] and create a forge release, that contains the [PREEMPT_RT patches] and distribution patches (compressed and signed) on top of the kernel version `X.Y.Z`.

### Updating the kernel config

The kernel config _must_ be adjusted upon major and minor releases of the kernel and _should_ be regenerated on patch-level releases.

For this purpose it is recommended to use the `make nconfig` target of the [source repository] (also available in the `prepare` function of the PKGBUILD).
When using the PKGBUILD for this (to ensure the correct application of patches), `makepkg` needs to be called, because `pkgctl` does not allow interactive use:

```bash
makepkg --nocheck --nobuild --nosign --nodeps
```

In addition, it is recommended to diff the existing config file with that of a matching version of the `linux` package to match and correlate the chosen options.

[PREEMPT_RT patches]: https://wiki.linuxfoundation.org/realtime/start
[`just`]: https://archlinux.org/packages/extra/x86_64/just/
[detached OpenPGP signature]: https://openpgp.dev/book/signing_data.html#detached-signatures
[distribution repository]: https://github.com/archlinux/linux
[realtime kernel]: https://wiki.archlinux.org/title/Realtime_kernel
[setting variables from the command line]: https://just.systems/man/en/setting-variables-from-the-command-line.html
[source repository]: https://gitlab.archlinux.org/archlinux/packaging/upstream/linux-rt
[upstream repository]: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/
