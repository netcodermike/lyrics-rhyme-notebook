# Using Lyrics Rhyme Notebook

## Quick start

Add: `ruby app.rb add "Your original line"`. Search: `ruby app.rb rhyme night`. Use `--file path.json` to choose a notebook. No copyrighted lyric corpus is bundled.

## Supported workflow

1. Local original-fragment notebook.
2. Case-normalized approximate suffix search.
3. Atomic JSON save for new fragments.

## Validation and troubleshooting

Run the commands in the README. Invalid inputs produce explicit errors rather than silently changing the requested operation. Browser audio requires a user gesture; microphone apps require HTTPS or localhost and permission. For file tools, supply supported input formats and writable output directories.

## Limitations

English spelling suffix heuristic, not phonetic rhyme detection. Homophones and irregular pronunciations can be missed.

Tests use synthetic fixtures. These tests do not certify hardware compatibility, real-world forecast quality, trained-model accuracy, or production suitability for every input.
