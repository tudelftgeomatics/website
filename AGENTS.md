# AGENTS.md — gm_landing

Jekyll 4.3.4 static site for the TU Delft MSc Geomatics student info page.
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
- **`index.md`** — home page; loops over `site.data.links` with Liquid. Renders the first news item as an Oat `role="alert"` banner above the grid.
- **`electives.md`** — `layout: page`, `permalink: /electives/`. Plain markdown procedure doc.
- **`faq.md`** — `layout: page`, `permalink: /faq/`. Q&A rendered as `<details>` accordions grouped per section via `name="faq-..."` (only one open per section). Uses kramdown auto-ToC (`* auto-generated ToC` + `{:toc}`); `toc_levels: 2..6` is set in `_config.yml`.
- **`q5.md`** — `layout: page`, `permalink: /q5/`. Embeds a Google Slides `<iframe>` (wrapped in a 16:9 responsive container) directly in markdown.
- **`a4.md`** — **special case**: `layout: null`, `permalink: /a4/`. Raw HTML `<meta http-equiv="refresh">` redirect to a SURFdrive URL. Not a normal page; don't apply layout changes to it.
- New pages: add a `.md` with front matter (`layout: page`, `permalink: ...`).

## Layouts

- `default.html` — bare wrapper: loads `oat.min.css` + `oat.min.js`, defines TU Delft cyan theme variables (`--primary: #00A6D6`) in `:root`, dark-mode overrides in `[data-theme="dark"]`, and the dark-mode toggle script. All other layouts wrap this.
- `home.html` — wraps default; sticky topnav (logo + "MSc Geomatics" + theme toggle button), hero section, content, and footer with GitHub edit link.
- `page.html` — wraps default; same topnav + toggle, a breadcrumb (`Home / {page.title}`), content `<article>` capped at 72ch, and footer.

## CSS / JS / Theming

- **Theme overrides** for Oat's CSS variables live in a `<style>` block in `_layouts/default.html` (TU Delft cyan for light, brighter cyan for dark). Override there, not in oat.min.css.
- Oat relies on CSS `light-dark()` + `color-scheme: light dark` for automatic dark mode. Manual toggle sets `data-theme="dark|light"` on `<html>` (must include `color-scheme` in the override rule — already done). State persists via `localStorage.theme`.
- The dark-mode toggle script lives in `_layouts/default.html` (the only JS on the site besides `oat.min.js`). The toggle button `#theme-toggle` is rendered by `home.html` / `page.html`.
- Oat grid classes in use: `container`, `row`, `col-4`, `card` (use `<article class="card">`), `table`, `badge`, utilities (`hstack`, `unstyled`). Tables, headings, buttons are styled semantically — no special classes needed.

## Build / deploy

- `_site/` is gitignored build output.
- **No deploy CI in this repo.** The site is published at `https://geomatics.bk.tudelft.nl` by some external process.
- **`deploy.sh` is stale/wrong** — it invokes `sphinx-build src _build` and rsyncs to a `geoit1501` path. It does not match this Jekyll site and will fail. Do not trust or run it without rewriting.

## Style / conventions

- No tests, no linter, no formatter — nothing to run for verification beyond `jekyll serve`.
- Edit links by modifying `_data/links.yml` (the home page footer points at that file on GitHub).
- CC0 licensed (see `LICENSE`).