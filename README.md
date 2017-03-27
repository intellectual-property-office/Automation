# UK Intellectual Property Office Frontend Build Tool

This is a batch script that will download and compile all UK IPO frontend styles, ready for use in your project.

It includes:
- <a href="https://github.com/alphagov/govuk_elements">GOV.UK elements</a>
- <a href="https://github.com/alphagov/govuk_frontend_toolkit">GOV.UK Frontend Toolkit</a>
- <a href="https://github.com/alphagov/govuk_template">GOV.UK Template</a>
- <a href="https://github.com/intellectual-property-office/Assets">UK Intellectual Property Office Assets</a>

All SASS will be output as CSS. 

Local IPO assets will be combined with existing GOV.UK styles. 

## Installation

Requires <a href="https://nodejs.org/en/">Node.js</a> version 3.X+

#### 1. Download or clone this repo
#### 2. Launch the batch script

## Usage

There are two usage modes available

<b>Install assets</b>

This script will compile a production ready frontend asset set. You will have the option to select the following outputs:

User mode: 

This will remove any files not needed for the frontend to function. It will also minify CSS and JS output files. Source files will be included. This mode is recommended for the majority of users.

Developer mode: 

This will keep all files used in the installation. You will be given the option to minify JS and CSS files. This is recommended for debug purposes. 

<b>Edit assets</b>

This script will set up a developer environment, that will allow you to make changes or additions to IPO assets.

## Help

For additional guidance, contact the UX team.
