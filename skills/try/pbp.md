## Validation
- Ensure test containers are started by running `sidecar-ctl up test`
- Check test container status with `sidecar-ctl status test`
- Run tests using `npm run test:devcontainer...` commands
    - `npm run test:devcontainer:setup` to set up the test environment
    - `npm run test:devcontainer:ci` to execute the tests, passing `--testNamePattern` to specify which tests to run
