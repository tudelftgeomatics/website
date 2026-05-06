# AGENTS.md — gm_landing

Jekyll 4.3.4 static site for the TU Delft MSc Geomatics student info page.
Uses [Chota](https://jenil.github.io/chota/) micro CSS framework.

## Dev commands

```sh
bundle install           # install Ruby deps (Gemfile)
bundle exec jekyll serve # local dev server at http://localhost:4000
```

`minima` theme is in the Gemfile but **not used** (commented out in `_config.yml`; site uses custom `_layouts/`).
Restart `jekyll serve` after editing `_config.yml`.

## Content model

- **`_data/links.yml`** — primary data source. Home page renders a card grid (`row` > `col-4` > `card`) from this YAML.
- **`electives.md`** — the only sub-page; uses `layout: page` with `permalink: /electives/`.
- New pages: add `.md` with front matter (`layout: page`, `permalink: ...`).
- Chota grid classes used: `row`, `col-4`, `card`, `striped`, `text-left`.

## Layouts

- `default.html` — bare wrapper, loads `chota.css`, defines unused `body.dark` style.
- `home.html` — wraps default, adds header image + footer with GitHub edit link.
- `page.html` — wraps default, just a container.

## Build output

`_site/` is gitignored build output. No deploy CI in this repo; site lives at `https://geomatics.bk.tudelft.nl`.

## Style / conventions

- No JavaScript.
- No tests.
- Edit links by modifying `_data/links.yml` (see the GitHub link in the home page footer).
- CC0 licensed.
