# OpenTelemetry Python contrib packaging

This split package builds instrumentation, distro, and HTTP utilities from the
contrib repository at `v0.66b1`, using the upstream contrib version for all three
Arch packages. Library-specific instrumentors are outside its scope.

The matching core release is `v1.45.1`, packaged under `python-opentelemetry`.
Build and install the core packages first: contrib's checks require its API, SDK,
semantic conventions, and test utilities. Core does not depend on contrib.

`check()` installs all three contrib wheels into a virtual environment and runs
each component's upstream suite against the packaged core dependencies.
HTTP utilities declare the instrumentation and semantic-convention imports
omitted from their upstream dependency metadata.

Nvchecker follows the contrib release on PyPI, including its beta version series.
Update core alongside contrib when the required semantic conventions change.
