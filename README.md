# UK Intellectual Property Office Frontend Build Tool

This is a batch script that will download and compile all UK IPO frontend styles, ready for use in your project.

It includes:
- <a href="https://github.com/alphagov/govuk_elements">GOV.UK elements</a>.
- <a href="https://github.com/alphagov/govuk_frontend_toolkit">GOV.UK Frontend Toolkit</a>.
- <a href="https://github.com/alphagov/govuk_template">GOV.UK Template</a>.
- <a href="https://github.com/intellectual-property-office/Assets">UK Intellectual Property Office Assets</a>.

All SASS will be output as CSS. 

Local IPO assets will be combined with existing GOV.UK styles. 

## Requirments

### To install assets
* <a href="https://nodejs.org/en/">Node.js</a> version 3.X+
* The script will bring down any remaining dependencies. 

### To develop assets
* The <a href="https://rubyinstaller.org/">Ruby</a> language.
* A local installation of <a href="http://sass-lang.com/">SASS</a>.

## Installation 

#### 1. Download or clone this repo.
#### 2. Launch the batch script.

## Usage

There are two usage modes available.

### Install assets

This script will compile a production ready frontend asset set. You will have the option to select from the following outputs:

* <b>User mode:</b> This will remove any files not needed for the frontend to function. It will also minify CSS and JS output files. Source map files will be included. You will be able to select a current 'stable' and previous 'legacy' release of assets. This mode is recommended for the majority of users.

* <b>Developer mode:</b> This will keep all files used in the installation including associated node packages. In addition to 'stable' and 'legacy' modes, you will be able to select an 'experimental' release option. This will provide you with the absolute latest version of each module. You will be given the option to minify JS and CSS files. This mode is recommended for debug purposes or users who want to test new styles that are currently under review by the UX Team. 

### Edit assets

This script will set up a developer environment, that will allow you to make changes or additions to IPO assets.

This requires a local installation of <a href="http://sass-lang.com/">SASS</a>.

You will have the option to select from the following outputs:

* <b>Sass User:</b> This will close the script after setting up the development environment.

* <b>Sass Developer:</b> This will start the SASS 'watch' command ready for development.

Run the following command from the root before continuing development in the future.

```sh
$ sass --watch scss:css
```

## Help

For additional guidance, contact the UX team.
