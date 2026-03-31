# Homebrew Tap for restk-cli

## Setup (one-time)

1. Create repo: `github.com/restk-org/homebrew-tap`
2. Copy `restk-cli.rb` to `Formula/restk-cli.rb` in that repo
3. Users can then install:

```bash
brew tap restk/tap
brew install restk-cli
```

## Updating on each release

After running `./release.sh production --version X.Y.Z`:

1. Get checksums: `curl -s https://releases.restk.ai/restk-cli-releases/production/cli/vX.Y.Z/checksums.txt`
2. Update `version "X.Y.Z"` in `restk-cli.rb`
3. Update all `sha256` values from checksums.txt
4. Commit and push to `restk-org/homebrew-tap`

## Automation

Add to `tools/restk-cli/release.sh` after R2 upload:

```bash
# Auto-update Homebrew formula
if [ "$RELEASE_MODE" = "production" ]; then
    CHECKSUMS=$(cat "$BUILD_DIR/checksums.txt")
    # Parse and update formula...
    # gh api repos/restk-org/homebrew-tap/contents/Formula/restk-cli.rb ...
fi
```
