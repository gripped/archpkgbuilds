#!/usr/bin/env -S just --working-directory . --justfile

###################
# Global variables.
###################
#
# Which GitLab host to use when creating releases.

gitlab_host := "gitlab.archlinux.org"

# Which sources to use as upstream sources.

sources := "git@gitlab.archlinux.org:archlinux/packaging/upstream/linux-rt-lts.git"

# Which sources to use as distribution upstream sources.

distribution_sources := "https://github.com/archlinux/linux.git"

# Which sources to use as distribution upstream sources.

upstream_sources := "https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git"

# Where to store the git repository of the upstream sources.

source_dir := "$HOME/.local/state/packaging/linux-rt-lts"

##################
# Private recipes.
##################

# Lists all available recipes.
[private]
@default:
    just --list

# Creates a patch between the two tags `tag1` and `tag2` in a directory `dir` for the project `name`.
[private]
create-diff-patch-between-tags tag1 tag2 dir name:
    printf 'Creating patch for commits between tags "%s" and "%s"...\n' "{{ tag1 }}" "{{ tag2 }}"
    just git diff "{{ tag1 }}".."{{ tag2 }}" > "{{ dir }}/{{ name }}-{{ replace(tag2, '-rebase', '') }}.patch"

    just sign-and-compress-file "{{ dir }}/{{ name }}-{{ replace(tag2, '-rebase', '') }}.patch"

# Creates a patch between the two tags `tag1` and `tag2` in a directory `dir` for the project `name`.
[private]
create-format-patch-between-tags tag1 tag2 dir name:
    printf 'Creating patch for commits between tags "%s" and "%s"...\n' "{{ tag1 }}" "{{ tag2 }}"
    just git format-patch --find-renames --stdout "{{ tag1 }}".."{{ tag2 }}" > "{{ dir }}/{{ name }}-{{ replace(tag2, '-rebase', '') }}.patch"

    just sign-and-compress-file "{{ dir }}/{{ name }}-{{ replace(tag2, '-rebase', '') }}.patch"

# Creates a detached OpenPGP signature for `file` using `gpg`, then compresses it using `zstd`.
[private]
sign-and-compress-file file:
    printf 'Signing file "%s"...\n' "$(basename "{{ file }}")"
    gpg --output "{{ file }}.sig" --default-key "$(just git config --local --get user.signingkey)" --detach-sign "{{ file }}"

    printf 'Compressing file "%s"...\n' "{{ file }}"
    zstd --compress --verbose "{{ file }}" -o "{{ file }}.zst"

# Derives the current tag from the current version of the source repository's `Makefile`.
[private]
derive-current-tag:
    printf 'v%s\n' "$(just extract-full-makefile-version)"

# Derives the tag used by the project (e.g. `v7.0-rt2` or `v7.0.1-rt2`) from a (full) distribution tag (e.g. `v7.0.0-rt2-arch1` or `v7.0.1-rt2-arch2`).
[private]
derive-project-tag-from-distribution-tag version:
    #!/usr/bin/env bash
    set -euo pipefail

    just ensure-command rg

    readonly version={{ version }}

    # NOTE: We assume `version` is derived from the kernel repository's Makefile.
    #       In it, the `SUBLEVEL` (patch level) version may be `0`.
    #       However, this is not reflected in tags, as upstream tags e.g. `v7.0`, not `v7.0.0`.
    if [[ "$(cut --fields 3 --delimiter '.' <<< "$version")" == 0* ]]; then
        rg 'v([0-9]+).([0-9]+).([0-9]+)([a-z\-0-9]*)-arch([0-9]+)' --color=never --only-matching --replace 'v$1.$2$4' <<< "$version"
    else
        rg 'v([0-9]+).([0-9]+).([0-9]+)([a-z\-0-9]*)-arch([0-9]+)' --color=never --only-matching --replace 'v$1.$2.$3$4' <<< "$version"
    fi

# Derives the current distribution tag (e.g. `v7.0.1-rt2-arch1`) from the current version of the source repository's Makefile.
[private]
derive-distribution-tag-from-makefile:
    #!/usr/bin/env bash
    set -euo pipefail

    tag="$(just derive-current-tag)"
    if [[ -z "$tag" ]]; then
        printf "No current tag found!\n" >&2
        exit 1
    fi
    if [[ "$tag" != *rt*-* ]]; then
        printf 'The preliminary tag %s does not contain a distribution version identifier after the "rt" identifier!\n' "$tag" >&2
        exit 1
    fi

    printf '%s\n' "$tag"

# Derives the project name from the directory name of the git source repository.
[private]
derive-project-name:
    basename "$(just git rev-parse --show-toplevel)"

# Derives the current upstream tag (e.g. `v7.0.1-rt2`) from the current version of the source repository's `Makefile` and `localversion-rt` file.
[private]
derive-project-tag-from-makefile-and-localversion:
    #!/usr/bin/env bash
    set -euo pipefail

    tag="$(just derive-current-tag)"
    if [[ -z "$tag" ]]; then
        printf "No current tag found!\n" >&2
        exit 1
    fi
    if [[ "$tag" == *rt* ]]; then
        printf 'The Makefile already contains the "rt" identifier (preliminary tag "%s")!\n' "$tag" >&2
        exit 1
    fi

    file="$(just get-source-dir)/localversion-rt"
    if [[ ! -f "$file" ]]; then
        printf 'The file "%s" does not exist!\n' "$file" >&2
        exit 1
    fi
    rt_id="$(<"$file")"
    if [[ "$rt_id" != *rt* ]]; then
        printf 'The file "%s" does not contain an "rt" identifier, but "%s" instead!\n' "$file" "$rt_id" >&2
        exit 1
    fi

    printf '%s\n' "$tag$rt_id"

# Derives the tag used by the upstream (kernel) project from a (full) distribution tag (e.g. `v7.0.0-rt2-arch1` or `v7.0.1-rt2-arch2`).
[private]
derive-upstream-tag-from-distribution-tag version:
    #!/usr/bin/env bash
    set -euo pipefail

    just ensure-command rg

    readonly version={{ version }}

    # NOTE: We assume `version` is derived from the kernel repository's Makefile.
    #       In it, the `SUBLEVEL` (patch level) version may be `0`.
    #       However, this is not reflected in tags, as upstream tags e.g. `v7.0`, not `v7.0.0`.
    if [[ "$(cut --fields 3 --delimiter '.' <<< "$version")" == 0* ]]; then
        rg 'v([0-9]+).([0-9]+).([0-9]+)([a-z\-0-9]*)-arch([0-9]+)' --color=never --only-matching --replace 'v$1.$2' <<< "$version"
    else
        rg 'v([0-9]+).([0-9]+).([0-9]+)([a-z\-0-9]*)-arch([0-9]+)' --color=never --only-matching --replace 'v$1.$2.$3' <<< "$version"
    fi

# Ensures that one or more required commands are installed.
[private]
ensure-command +command:
    #!/usr/bin/env bash
    set -euo pipefail

    read -r -a commands <<< "{{ command }}"

    for cmd in "${commands[@]}"; do
        if ! command -v "$cmd" > /dev/null 2>&1 ; then
            printf "Unable to find required executable '%s'\n" "$cmd" >&2
            exit 1
        fi
    done

# Ensures that a tag does not yet exist locally.
[private]
ensure-tag-does-not-exist tag:
    #!/usr/bin/env bash
    set -euo pipefail

    readonly tag={{ tag }}

    if [[ -n "$(just git tag -l "$tag")" ]]; then
        printf 'The tag %s exists already!\n' "$tag" >&2
        exit 1
    fi

# Ensures that a tag exists locally.
[private]
ensure-tag-exists tag:
    #!/usr/bin/env bash
    set -euo pipefail

    readonly tag={{ tag }}

    if [[ -z "$(just git tag -l "$tag")" ]]; then
        printf 'The tag %s does not yet exist!\n' "$tag" >&2
        exit 1
    fi

# Extracts the current version from the source repository's Makefile.
[private]
extract-full-makefile-version:
    just ensure-command rg
    rg '^VERSION = ([0-9]+)\n^PATCHLEVEL = ([0-9]+)\n^SUBLEVEL = ([0-9]+)\n^EXTRAVERSION =([\s]*)([a-z\-0-9]*)' --color=never --multiline --no-line-number --only-matching --replace '$1.$2.$3$5' {{ source_dir }}/Makefile

################
# Check recipes.
################

# Checks source code formatting.
[group('check')]
check-formatting:
    just ensure-command mado
    just --fmt --check
    mado check

######################
# Development recipes.
######################

# Fetches updates for the upstream git source repository.
[group('dev')]
fetch-sources:
    just ensure-command git
    just git fetch --tags
    just git fetch upstream --tags
    just git fetch distribution --tags

[group('dev')]
get-source-dir:
    printf '%s\n' "{{ source_dir }}"

# Calls git in the upstream git source repository (short for `git -C source_dir options`).
[group('dev')]
git *options:
    just ensure-command git
    git -C {{ source_dir }} {{ options }}

# Sets up the upstream git source repository to work with.
[group('dev')]
setup-sources:
    just ensure-command git
    mkdir --parents --verbose "$(basename "{{ source_dir }}")"
    git clone {{ sources }} {{ source_dir }}
    just git remote add upstream {{ upstream_sources }}
    just git remote add distribution {{ distribution_sources }}
    just fetch-sources

##################
# Release recipes.
##################

# Creates a tag for an intermediate, rebased version of the preempt-rt patch set.
[group('release')]
tag-rt:
    #!/usr/bin/env bash
    set -euo pipefail

    just ensure-command git

    tag="$(just derive-project-tag-from-makefile-and-localversion)-rebase"
    just ensure-tag-does-not-exist "$tag"

    printf "Creating tag %s\n" "$tag"
    just git tag -s "$tag" -m "$tag"
    printf "Pushing tag %s\n" "$tag"
    just git push origin refs/tags/"$tag"

# Create release for a tag and upload a signed patch for all commits between the upstream tag and the targeted tag
[group('release')]
release:
    #!/usr/bin/env bash
    set -euo pipefail

    just ensure-command git glab gpg

    # The project name (according to the name of the git repository).
    project_name="$(just derive-project-name)"
    if [[ -z "$project_name" ]]; then
        printf "No project name found!\n" >&2
        exit 1
    fi
    readonly project_name="$project_name"
    printf 'Preparing release for "%s"...\n' "$project_name"

    # The distribution tag (e.g. `v7.0-rt2-arch1` or `v7.0.1-rt2-arch1`).
    distribution_tag="$(just derive-distribution-tag-from-makefile)"
    just ensure-tag-does-not-exist "$distribution_tag"
    printf 'Targeting distribution tag "%s", ' "$distribution_tag"

    # The project tag (e.g. `v7.0-rt2` or `v7.0.1-rt2`).
    project_tag="$(just derive-project-tag-from-distribution-tag "$distribution_tag")-rebase"
    just ensure-tag-exists "$project_tag"
    printf 'project tag "%s", ' "$project_tag"

    # The upstream tag (e.g. `v7.0` or `v7.0.1`).
    upstream_tag="$(just derive-upstream-tag-from-distribution-tag "$distribution_tag")"
    just ensure-tag-exists "$upstream_tag"
    printf 'and upstream tag "%s"\n' "$upstream_tag"

    printf 'Checking GitLab authentication...\n'
    glab auth status --hostname {{ gitlab_host }}

    tmpdir="$(mktemp --dry-run --directory)"
    readonly tmpdir="$tmpdir"
    mkdir --parents "$tmpdir"

    # remove temporary dir on exit
    cleanup() (
      if [[ -n "${tmpdir:-}" ]]; then
        rm --force --recursive "$tmpdir"
      fi
    )

    trap cleanup EXIT

    # Create the (zstd compressed and signed) project patch file.
    just create-format-patch-between-tags "$upstream_tag" "$project_tag" "$tmpdir" "$project_name"

    printf 'Creating distribution tag "%s"...\n' "$distribution_tag"
    just git tag --sign "$distribution_tag" --message "$distribution_tag"

    # Create the (zstd compressed and signed) distribution patch file.
    just create-format-patch-between-tags "$project_tag" "$distribution_tag" "$tmpdir" "$project_name"

    printf 'Pushing tag "%s"...\n' "$distribution_tag"
    just git push origin refs/tags/"$distribution_tag"

    printf 'Creating release for tag "%s" and uploading signed artifacts...\n' "$distribution_tag"
    GITLAB_HOST={{ gitlab_host }} glab release create "$distribution_tag" "$tmpdir/$project_name-"*.{sig,zst} --name="$distribution_tag" --notes="$distribution_tag" --repo {{ sources }}
