# IPO frontend build tool

This is a batch script that will download all IPO frontend styles ready for use in your project.

It includes:
- <a href="https://github.com/alphagov/govuk_elements">GOV.UK elements</a>
- <a href="https://github.com/alphagov/govuk_frontend_toolkit">GOV.UK frontend toolkit</a>
- <a href="https://github.com/alphagov/govuk_template">GOV.UK template</a>
- <a href="https://github.com/intellectual-property-office/Assets">IPO assets</a>

All SASS will be compiled and output as CSS. 

Local IPO assets will be combined with existing GOV.UK styles. 

## Installation

Requires <a href="https://nodejs.org/en/">Node.js</a> version 3.X+

#### 1. Download or clone this repo
#### 2. Launch the batch script

## Usage

There are two modes available

<b>User mode:</b>

This will remove any file not needed for the frontend to function. It will also minify CSS and JS output files. Source files will be included. This mode is recommended for the majority of users.

<b>Developer mode:</b>

This will keep all files used in the installation. CSS and JS will remain un-minified. This is recommended for debug purposes. 

## Help

For additional guidance, contact the UX team.
