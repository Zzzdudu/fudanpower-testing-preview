# Editing the Testing Services Page

The public page is available at:

`https://fudanpower.github.io/testing-services/`

Most content is stored in:

`_data/testing_services.yml`

After editing the YAML file on GitHub and committing the change, GitHub Pages will rebuild the site automatically.

## Common Edits

- Contact email: edit `platform.contact_email`.
- Contact name: edit `platform.contact_name`.
- Unit name: edit `platform.contact_unit`.
- Hero image: edit `platform.hero_image`.
- Equipment categories: edit `categories`.
- Add, remove, or edit equipment: edit `devices`.
- Appointment requirements: edit `request_fields`.
- Charging explanation: edit `charging`.
- Safety and compliance notes: edit `notice`.

## Adding a New Device

Copy one existing item under `devices`, then update:

- `id`: short English identifier, for example `probe-station`.
- `name`: English equipment name.
- `name_cn`: Chinese equipment name.
- `model`: model and configuration.
- `status`: appointment status.
- `image`: image path, usually `/images/testing-services/example.jpg`.
- `tags`: category IDs from the `categories` list.
- `summary`: short card description.
- `intro`: paragraphs for the detail page.
- `specifications`: technical indicators.

## Replacing Equipment Photos

Put images under:

`images/testing-services/`

Recommended names:

- `b1505a.jpg`
- `b1500a.jpg`
- `radiant-premier-ii.jpg`

Then update each device's `image` field in `_data/testing_services.yml`.

## YAML Notes

- Keep indentation with two spaces.
- Put text in quotation marks if it contains punctuation such as `:`.
- For lists, keep the leading `-`.
- Do not use tabs.

