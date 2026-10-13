# caster-test-c4-builds

A test fixture for Caster builds. `main` is a two-file Flask app, which Railpack plans with Python.
The `probe` branch is a Dockerfile build that fails if the build can reach the instance metadata
address or the cluster's API server, and that succeeds when it can reach the public internet.
