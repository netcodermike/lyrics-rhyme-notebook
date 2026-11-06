# Lyrics Rhyme Notebook

Keep original lyric fragments in a local JSON notebook and search approximate suffix rhymes.

**Language:** Ruby · **License:** MIT · **Data:** Local by default

## What it does

- Local original-fragment notebook
- Case-normalized approximate suffix search
- Atomic JSON save for new fragments

## Requirements

Ruby 3.1 or newer.

## Install, validate, and run

```sh
ruby app.rb --self-test
ruby app.rb demo
```

Run `--help` where supported, or follow the examples in [docs/usage.md](docs/usage.md). Input files are never overwritten unless explicitly documented.

## Usage and examples

See [docs/usage.md](docs/usage.md) for a walkthrough and [docs/architecture.md](docs/architecture.md) for implementation details. Tests are deterministic and do not require an exchange, paid API, external model, microphone, or private data.

## Boundaries

English spelling suffix heuristic, not phonetic rhyme detection. Homophones and irregular pronunciations can be missed.

## Privacy

No analytics or accounts are built in. Local file tools process only the paths you supply. For model-server and weather apps, the interface and usage guide identify the destination and the data sent. Do not commit personal input files, model credentials, or generated recordings.

## Development

Run the validation commands above before submitting changes. GitHub Actions runs these checks on pushes and pull requests. See the workflow for the reproducible toolchain. A successful workflow verifies the tested paths; manual audio-device behavior is documented separately.
