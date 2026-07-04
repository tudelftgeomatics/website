# AGENTS.md — gm_landing

Jekyll 4.3.4 static site for the TU Delft MSc Geomatics for the Built Environment student info page.
Uses the [Oat](https://oat.ink/) UI library — semantic, zero-dependency, ~7KB CSS + ~3KB JS, bundled locally at `css/oat.min.css` and `js/oat.min.js`.

## Dev commands

```sh
bundle install           # install Ruby deps (Gemfile)
bundle exec jekyll serve # local dev server at http://localhost:4000
```

`minima` is listed in the Gemfile but commented out — **not used**. The site uses custom `_layouts/` only.
Restart `jekyll serve` after editing `_config.yml` (it is not auto-reloaded).

## Content model

- **`_data/links.yml`** — primary data source. The home page renders a card grid (`row` > `col-4` > `article.card`) from this YAML. Each entry has `category`, and `links[]` with `name`, `url1`, `desc`, optional `url2`.
- **`index.md`** — home page; loops over `site.data.links` with Liquid. Just the card grid (no hero, no news banner).
- **`electives.md`** — `layout: page`, `permalink: /electives/`. Plain markdown procedure doc.
- **`faq.md`** — `layout: page`, `permalink: /faq/`. Q&A rendered as `<details>` accordions grouped per section via `name="faq-..."` (only one open per section). Uses kramdown auto-ToC (`* auto-generated ToC` + `{:toc}`); `toc_levels: 2..6` is set in `_config.yml`. Markdown inside `<details>` requires the `markdown="1"` attribute (kramdown quirk) — already applied to all accordions.
- **`q5.md`** — `layout: page`, `permalink: /q5/`. Embeds a Google Slides `<iframe>` (wrapped in a 16:9 responsive container) directly in markdown.
- **`a4.md`** — **special case**: `layout: null`, `permalink: /a4/`. Raw HTML `<meta http-equiv="refresh">` redirect to a SURFdrive URL. Not a normal page; don't apply layout changes to it.
- New pages: add a `.md` with front matter (`layout: page`, `permalink: ...`).

## Layouts

- `default.html` — bare wrapper: loads `oat.min.css` + `oat.min.js`, defines theme variables in a `<style>` block (see Theming below), and injects `{{ content }}`. **No top bar, no dark-mode toggle, no inline JS** — only `oat.min.js` is loaded.
- `home.html` — wraps default; renders a centered `<header class="home-header">` with the BK voxels logo (150px) + muted "MSc Geomatics for the Built Environment" tagline, then `<main id="home-content">` with the card grid, then a `<footer class="site-footer">` with the GitHub edit link.
- `page.html` — wraps default; no header, just a breadcrumb (`Home / {page.title}`) and `<article>` capped at 72ch. **No footer.**

## Theming

- **Light mode only.** `color-scheme: light` is set on `:root`. There is no dark-mode toggle and no `[data-theme]` support.
- The theme primary was changed from Oat's default brown to a dark-red (`--primary: #934e51` — also applies to `--ring`). Links and focus rings use this color.
- Theme overrides live in a `<style>` block in `_layouts/default.html`. Override there, not in `oat.min.css`.

## Home page styling (scoped to `#home-content`)

These are custom rules in `_layouts/default.html` — easy to miss:

- **Cards**: no border, faint dark-red background (`#fbf5f5`).
- **Links**: bold (600), `--primary` color, no underline; underline appears on hover.
- **News card (first card)**: dates in the first column render in `ui-monospace` and regular weight (overrides the bold link rule for that column).

## Build / deploy

- `_site/` is gitignored build output.
- **No deploy CI in this repo.** The site is published at `https://geomatics.bk.tudelft.nl` by some external process.
- **`deploy.sh` is stale/wrong** — it invokes `sphinx-build src _build` and rsyncs to a `geoit1501` path. It does not match this Jekyll site and will fail. Do not trust or run it without rewriting.

## Style / conventions

- No tests, no linter, no formatter — nothing to run for verification beyond `jekyll build` / `jekyll serve`.
- Edit links by modifying `_data/links.yml` (the home page footer points at that file on GitHub).
- CC0 licensed (see `LICENSE`).