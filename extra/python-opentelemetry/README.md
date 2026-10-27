# OpenTelemetry Python packaging

This split package consolidates the nine existing OpenTelemetry Python packages
and adds HTTP transport and OTLP common utilities, producing eleven packages from
the core upstream repository. Instrumentation, distro, and HTTP utilities are
packaged separately under `python-opentelemetry-contrib`.

Core `v1.45.1` and contrib `v0.66b1` are matching upstream releases. Packages in
this base retain the core release version, following the existing convention for
semantic-conventions and test-utils. Python distribution metadata keeps each
component's upstream version. Each base tracks its own release through nvchecker;
update them together when contrib requires the matching semantic conventions.
Build and install the core packages before checking contrib.

The package names remain the same, so consumers need no dependency renames or
`replaces` entries. Publish this package base in place of the nine old package
bases; the existing local checkouts are retained, including pending edits.

`check()` installs all built wheels into one virtual environment before running
each component's upstream suite, resolving the SDK/test-utils dependency cycle.
Local HTTP/gRPC tests and the existing benchmark coverage remain enabled.
Upstream automatically skips Weaver integration tests when the unpackaged
`weaver` executable is unavailable.

The protobuf HTTP exporter at 1.45.1 requires `requests`; its default transport
was restored in [upstream PR #5751](https://github.com/open-telemetry/opentelemetry-python/pull/5751)
after the 1.45.0 release. Both HTTP transport implementations remain
available as optional dependencies of the transport package.
