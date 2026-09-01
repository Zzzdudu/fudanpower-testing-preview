# Publish This Preview Site Under Your GitHub Account

This repository is a safe preview copy of the original group website plus the new testing-services page.

It does not need write access to the original `fudanpower/fudanpower.github.io` repository.

## What Was Changed

- Added the testing services page at `/testing-services/`.
- Added editable service data in `_data/testing_services.yml`.
- Added page-specific styles in `_sass/_testing_services.scss`.
- Added the navigation item `Testing Services`.
- Added a temporary lab image at `images/testing-services/lab-testing-hero.png`.

## Before Publishing

Replace `YOUR_GITHUB_USERNAME` in `_config.yml` with your actual GitHub username.

The preview URL will be:

`https://YOUR_GITHUB_USERNAME.github.io/fudanpower-testing-preview/testing-services/`

## Create the GitHub Repository

1. Log in to your GitHub account.
2. Create a new public repository named:

   `fudanpower-testing-preview`

3. Do not initialize it with README, license, or `.gitignore`.

## Push From PowerShell

Run:

```powershell
cd D:\CodexProjects\fudanpower-testing-preview
git remote set-url origin https://github.com/YOUR_GITHUB_USERNAME/fudanpower-testing-preview.git
git push -u origin master
```

If GitHub asks you to log in, use your own account.

## Enable GitHub Pages

In the new repository:

`Settings -> Pages -> Build and deployment`

Choose:

- Source: `Deploy from a branch`
- Branch: `master`
- Folder: `/ (root)`

After GitHub Pages finishes building, open:

`https://YOUR_GITHUB_USERNAME.github.io/fudanpower-testing-preview/testing-services/`

## Editing the Page Later

Most content is in:

`_data/testing_services.yml`

Edit that file on GitHub, commit, and wait for GitHub Pages to rebuild.

Common fields:

- `platform.contact_email`: appointment email
- `platform.contact_name`: contact person
- `platform.contact_unit`: group or school name
- `devices`: equipment list
- `charging`: charging explanation
- `notice`: safety and compliance notes

