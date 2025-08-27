#! /usr/bin/env sh

OUT=$(mktemp -d)
# Arch selection doesn't work with integrated APU, so we just pick the first
# arch listed by the agent enumerator
/opt/rocm/bin/hipfc --offload-arch=$(rocm_agent_enumerator | head -n1) test.f03 test.cpp -o "$OUT"/test
"$OUT"/test
