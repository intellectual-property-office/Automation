@echo off

:: Installer version
echo.
echo.
echo.
echo.
echo "                                              "
echo " '||' '||''|.   ..|''||                       "
echo "  ||   ||   || .|'    ||                      "
echo "  ||   ||...|' ||      ||                     "
echo "  ||   ||      '|.     ||                     "
echo " .||. .||.      ''|...|'                      "
echo "                                              "
echo "                                              "
echo "     |                             .          "
echo "    |||     ....   ....    ....  .||.   ....  "
echo "   |  ||   ||. '  ||. '  .|...||  ||   ||. '  "
echo "  .''''|.  . '|.. . '|.. ||       ||   . '|.. "
echo " .|.  .||. |'..|' |'..|'  '|...'  '|.' |'..|' "
echo "                                              "
echo "                                              "
echo.
echo.
echo.
echo.


:: --------------------------------------------------
:: ----------------- Select script ------------------
:: --------------------------------------------------


:: Select Environment
echo.
echo ************************************************************
echo *                                                          *
echo *                       Select Script                      *
echo *                                                          *
echo ************************************************************
echo.

:MENU
echo 1 - Install assets - this script will compile a production ready frontend asset set.
echo 2 - Edit assets - this script will set up a developer environment, that will allow you to make changes or additions to IPO assets.
echo.
SET /P ScriptType=Type 1 or 2 then press ENTER:
IF %ScriptType%==1 GOTO install
IF %ScriptType%==2 GOTO edit


:install
echo.
echo.
echo.
echo.
echo "                                              "
echo " '||'                   .           '||  '||  "
echo "  ||  .. ...    ....  .||.   ....    ||   ||  "
echo "  ||   ||  ||  ||. '   ||   '' .||   ||   ||  "
echo "  ||   ||  ||  . '|..  ||   .|' ||   ||   ||  "
echo " .||. .||. ||. |'..|'  '|.' '|..'|' .||. .||. "
echo "                                              "
echo "                                              "
echo "     |                             .          "
echo "    |||     ....   ....    ....  .||.   ....  "
echo "   |  ||   ||. '  ||. '  .|...||  ||   ||. '  "
echo "  .''''|.  . '|.. . '|.. ||       ||   . '|.. "
echo " .|.  .||. |'..|' |'..|'  '|...'  '|.' |'..|' "
echo "                                              "
echo "                                              "
echo.
echo.
echo.
echo.
goto :prerequisites

:edit
echo.
echo.
echo.
echo.
echo "                                              "
echo " '||''''|       '||   ||    .                 "
echo "  ||  .       .. ||  ...  .||.                "
echo "  ||''|     .'  '||   ||   ||                 "
echo "  ||        |.   ||   ||   ||                 "
echo " .||.....|  '|..'||. .||.  '|.'               "
echo "                                              "
echo "                                              "
echo "     |                             .          "
echo "    |||     ....   ....    ....  .||.   ....  "
echo "   |  ||   ||. '  ||. '  .|...||  ||   ||. '  "
echo "  .''''|.  . '|.. . '|.. ||       ||   . '|.. "
echo " .|.  .||. |'..|' |'..|'  '|...'  '|.' |'..|' "
echo "                                              "
echo.
echo.
echo.
echo.
goto :prerequisites

:prerequisites
:: Setup prerequisites
echo.
echo ************************************************************
echo *                                                          *
echo *                      Prerequisites                       *
echo *                                                          *
echo ************************************************************
echo.

:: Set up frotend folder structure
echo CREATING frontend folder structure
md "frontend\assets\scss"
md "frontend\assets\stylesheets\external-links"
md "frontend\assets\stylesheets\font-awesome\css"
md "frontend\assets\stylesheets\font-awesome\fonts"
echo DONE
echo.

:: Create gulp config file for compiling SCSS to CSS
echo CREATING Gulp Config File
echo 'use strict'; > "frontend\gulpfile.js"
echo. >> "frontend\gulpfile.js"
echo var gulp = require('gulp'); >> "frontend\gulpfile.js"
echo var sass = require('gulp-sass'); >> "frontend\gulpfile.js"
echo. >> "frontend\gulpfile.js"
echo var repo_root = __dirname + '/'; >> "frontend\gulpfile.js"
echo var govuk_frontend_toolkit_root =  repo_root + 'node_modules/govuk_frontend_toolkit/stylesheets'; // 1. >> "frontend\gulpfile.js"
echo var govuk_elements_sass_root =  repo_root + 'node_modules/govuk-elements-sass/public/sass';       // 2. >> "frontend\gulpfile.js"
echo var ipo_elements_sass_root =  repo_root + 'node_modules/ipo-assets-frontend-frontend/sass';       // 3. >> "frontend\gulpfile.js"
echo. >> "frontend\gulpfile.js"
echo // Compile scss files to css >> "frontend\gulpfile.js"
echo gulp.task('styles', function () { >> "frontend\gulpfile.js"
echo   return gulp.src('./assets/scss/**/*.scss') >> "frontend\gulpfile.js"
echo     .pipe(sass({includePaths: [ >> "frontend\gulpfile.js"
echo       govuk_frontend_toolkit_root, >> "frontend\gulpfile.js"
echo       govuk_elements_sass_root, >> "frontend\gulpfile.js"
echo       ipo_elements_sass_root >> "frontend\gulpfile.js"
echo       ]}).on('error', sass.logError)) >> "frontend\gulpfile.js"
echo     .pipe(gulp.dest('./assets/stylesheets')); >> "frontend\gulpfile.js"
echo }); >> "frontend\gulpfile.js"
echo DONE
echo.

:: Create main.scss and add all SCSS (partials) ready for compiling
echo IMPORTING Styles To "main.scss"
echo // Import GovUK Sass > "frontend\assets\scss\main.scss"
echo @import "../../node_modules/govuk-elements-sass/public/sass/govuk-elements"; >> "frontend\assets\scss\main.scss"
echo. >> "frontend\assets\scss\main.scss"
echo // Path to assets for use with the file-url function >> "frontend\assets\scss\main.scss"
echo // in the govuk frontend toolkit's url-helpers partial >> "frontend\assets\scss\main.scss"
echo $path: "../../node_modules/govuk_frontend_toolkit/images/"; >> "frontend\assets\scss\main.scss"
echo. >> "frontend\assets\scss\main.scss"
echo // Import IPO Sass >> "frontend\assets\scss\main.scss"
echo @import "../../node_modules/ipo-assets-frontend/sass/ipo-screen-elements.scss"; >> "frontend\assets\scss\main.scss"
echo DONE
echo.
:: Outputs core CSS file

:: Create main-ie6.scss and add all IE6 specific SCSS (partials) ready for compiling
echo PREPARING IE6 Specific Style Sheet 'main-ie6.scss'
echo $is-ie: true; > "frontend\assets\scss\main-ie6.scss"
echo $ie-version: 6; >> "frontend\assets\scss\main-ie6.scss"
echo $mobile-ie6: false; >> "frontend\assets\scss\main-ie6.scss"
echo. >> "frontend\assets\scss\main-ie6.scss"
echo @import "main"; >> "frontend\assets\scss\main-ie6.scss"
echo DONE
echo.
:: Outputs IE6 main CSS file


:: Create main-ie7.scss and add all IE7 specific SCSS (partials) ready for compiling
echo PREPARING IE7 Specific Style Sheet 'main-ie7.scss'
echo $is-ie: true; > "frontend\assets\scss\main-ie7.scss"
echo $ie-version: 7; >> "frontend\assets\scss\main-ie7.scss"
echo. >> "frontend\assets\scss\main-ie7.scss"
echo @import "main"; >> "frontend\assets\scss\main-ie7.scss"
echo DONE
echo.
:: Outputs IE7 main CSS file


:: Create main-ie8.scss and add all IE8 specific SCSS (partials) ready for compiling
echo PREPARING IE8 Specific Style Sheet 'main-ie8.scss'
echo $is-ie: true; > "frontend\assets\scss\main-ie8.scss"
echo $ie-version: 8; >> "frontend\assets\scss\main-ie8.scss"
echo. >> "frontend\assets\scss\main-ie8.scss"
echo @import "main"; >> "frontend\assets\scss\main-ie8.scss"
echo DONE
echo.
:: Outputs IE8 main CSS file

:: Create ipo-print.scss and add all print specific SCSS (partials) ready for compiling
echo PREPARING Print Specific Style Sheet 'ipo-print.scss'
echo // Import IPO Sass > "frontend\assets\scss\ipo-print.scss"
echo @import "../../node_modules/ipo-assets-frontend/sass/ipo-print-elements.scss"; >> "frontend\assets\scss\ipo-print.scss"
echo DONE
echo.
:: Outputs IPO Print CSS file

:: Create ipo-fonts.scss and add all font specific SCSS (partials) ready for compiling
echo PREPARING IPO Fonts Style Sheet 'ipo-fonts.scss'
echo // Import IPO Fonts > "frontend\assets\scss\ipo-fonts.scss"
echo @import "../../node_modules/ipo-assets-frontend/sass/ipo-fonts.scss"; >> "frontend\assets\scss\ipo-fonts.scss"
echo DONE
:: Outputs IPO Font CSS file

:: Move script working directory to frontend folder
cd frontend
echo.
echo.
echo.
echo.

:: Install dependencies
echo.
echo ************************************************************
echo *                                                          *
echo *                  Installing Dependencies                 *
echo *                                                          *
echo ************************************************************
echo.
:: Install gulp locally in project (REQUIRED TO RUN GULP COMMANDS)
echo INSTALLING Local Gulp
call npm install --save-dev gulp
echo DONE
echo.
:: Install gulp-sass locally in project (REQUIRED TO RUN COMPILE COMMANDS)
echo INSTALLING Gulp Sass Dependency
call npm install gulp-sass --save-dev
echo DONE
echo.
:: Install Font Awesome (Not required as part of GovUK Styles, but relevant for certain IPO additions)
echo INSTALLING Font Awesome
call npm install font-awesome
echo DONE
echo.
echo.
echo.
echo.

:: Select Environment
echo.
echo ************************************************************
echo *                                                          *
echo *                    Select Environment                    *
echo *                                                          *
echo ************************************************************
echo.
:MENU
echo 1 - User - recommended for most people, production ready assets.
echo 2 - Developer - recommended for debuging or advanced configuration.
echo.
set /P UserType=Type 1 or 2 then press ENTER:
if %UserType%==1 (
  set role=user
  goto user
)
if %UserType%==2 (
  set role=developer
  goto developer
)

:: USER ENVIRONMENT
:user
echo.
echo.
echo.
echo.
echo "                                      "
echo " '||'  '|'                            "
echo "  ||    |   ....    ....  ... ..      "
echo "  ||    |  ||. '  .|...||  ||' ''     "
echo "  ||    |  . '|.. ||       ||         "
echo "   '|..'   |'..|'  '|...' .||.        "
echo "                                      "
echo.
echo.
echo.
echo.

:: Select Asset Version
echo.
echo ************************************************************
echo *                                                          *
echo *                   Select Assets Version                  *
echo *                                                          *
echo ************************************************************
echo.
:MENU
echo 1 - Stable - The latest stable release.
echo 2 - Legacy - The previous release.
echo.
SET /P ReleaseType=Type 1 or 2 then press ENTER:
IF %ReleaseType%==1 GOTO stable
IF %ReleaseType%==2 GOTO legacy

:: DEVELOPER ENVIRONMENT
:developer
echo.
echo.
echo.
echo.
echo "                                                                          "
echo " '||''|.                            '||                                   "
echo "  ||   ||    ....  .... ...   ....   ||    ...   ... ...    ....  ... ..  "
echo "  ||    || .|...||  '|.  |  .|...||  ||  .|  '|.  ||'  || .|...||  ||' '' "
echo "  ||    || ||        '|.|   ||       ||  ||   ||  ||    | ||       ||     "
echo " .||...|'   '|...'    '|     '|...' .||.  '|..|'  ||...'   '|...' .||.    "
echo "                                                  ||                      "
echo "                                                 ''''                     "
echo.
echo.
echo.
echo.

:: Select Assets Version
echo.
echo ************************************************************
echo *                                                          *
echo *                   Select Assets Version                  *
echo *                                                          *
echo ************************************************************
echo.
:MENU
echo 1 - Stable - The latest stable release.
echo 2 - Legacy - The previous release.
echo 3 - Experimental - The latest release (WARNING: MAY NOT BE FULLY FUNCTIONAL).
echo.
SET /P ReleaseType=Type 1, 2 or 3 then press ENTER:
IF %ReleaseType%==1 GOTO stable
IF %ReleaseType%==2 GOTO legacy
IF %ReleaseType%==3 GOTO experimental

:: LATEST (STABLE) ASSETS
:stable
echo.
echo ************************************************************
echo *                                                          *
echo *                  Stable Assets Selected                  *
echo *                                                          *
echo ************************************************************
echo.
:: Install govuk-elements-sass and govuk_frontend_toolkit NPM modules (SCSS + JS + Images)
echo INSTALLING GovUK Elements Sass
call npm install govuk-elements-sass@3.0.2
echo DONE
echo.
:: Install govuk_template_ejs NPM module (CSS)
echo INSTALLING GovUK Template CSS
call npm i govuk_template_ejs
echo DONE
echo.
:: Install ipo-assets-frontend NPM module (SCSS + Images)
echo INSTALLING IPO Template Sass
call npm i ipo-assets-frontend
echo DONE
echo.
echo LATEST (STABLE) INSTALLATION SUCCESFUL
echo.
goto :import

:: LEGACY ASSETS
:legacy
echo.
echo ************************************************************
echo *                                                          *
echo *                  Legacy Assets Selected                  *
echo *                                                          *
echo ************************************************************
echo.
:: Install govuk-elements-sass and govuk_frontend_toolkit NPM modules (SCSS + JS + Images)
echo INSTALLING GovUK Elements Sass
call npm install govuk-elements-sass@2.1.2
echo DONE
echo.
:: Install govuk_template_ejs NPM module (CSS)
echo INSTALLING GovUK Template CSS
call npm i govuk_template_ejs
echo DONE
echo.
:: Install ipo-assets-frontend NPM module (SCSS + Images)
echo INSTALLING IPO Template Sass
call npm i ipo-assets-frontend
echo DONE
echo.
echo LEGACY INSTALLATION SUCCESFUL
echo.
goto :import

:: EXPERIMENTAL ASSETS
:experimental
echo.
echo ************************************************************
echo *                                                          *
echo *              Experimental Assets Selected                *
echo *                                                          *
echo ************************************************************
echo.
:: Install govuk-elements-sass and govuk_frontend_toolkit NPM modules (SCSS + JS + Images)
echo INSTALLING GovUK Elements Sass
call npm install govuk-elements-sass
echo DONE
echo.
:: Install govuk_template_ejs NPM module (CSS)
echo INSTALLING GovUK Template CSS
call npm i govuk_template_ejs
echo DONE
echo.
:: Install ipo-assets-frontend NPM module (SCSS + Images)
echo INSTALLING IPO Template Sass
call npm i ipo-assets-frontend
echo DONE
echo.
echo EXPERIMENTAL INSTALLATION SUCCESFUL
echo.
goto :import

:: Import images, raw CSS and font awesome to correct folders
:import
echo.
echo ************************************************************
echo *                                                          *
echo *                     Importing Files                      *
echo *                                                          *
echo ************************************************************
echo.
:: Copy files from govuk_template_ejs NPM module (CSS + JS + Images)
echo IMPORTING GovUK Template CSS
xcopy /s "node_modules\govuk_template_ejs\assets" "assets"
echo DONE
:: Copy images from ipo-assets-frontend NPM module
echo IMPORTING IPO Images
xcopy /s "node_modules\ipo-assets-frontend\images" "assets\images"
xcopy /s "node_modules\ipo-assets-frontend\external-links" "assets\stylesheets\external-links"
echo DONE
:: Copy font awesome CSS and fonts
echo IMPORTING Font Awesome
xcopy /s "node_modules\font-awesome\css\font-awesome.min.css" "assets\stylesheets\font-awesome\css"
xcopy /s "node_modules\font-awesome\css\font-awesome.css.map" "assets\stylesheets\font-awesome\css"
xcopy /s "node_modules\font-awesome\fonts" "assets\stylesheets\font-awesome\fonts"
echo DONE
echo.
goto :compile

:: Compile
:compile
echo.
echo ************************************************************
echo *                                                          *
echo *                        Compile CSS                       *
echo *                                                          *
echo ************************************************************
echo.
:: Run gulp command to compile SCSS to CSS
echo COMPILING CSS
call gulp styles
echo DONE
echo.

:: Give developer option to minify
if "%role%" == "developer" (
    goto :minify-choice
) else (
    goto :minify
)

:: Minify Choice
:minify-choice
:choice
set /P c=Do you want to minify CSS and JS? (Y/N)
if /I "%c%" EQU "Y" goto :minify
if /I "%c%" EQU "N" goto :pause
goto :choice


:: Minify
:minify
echo.
echo ************************************************************
echo *                                                          *
echo *                       Minify Files                       *
echo *                                                          *
echo ************************************************************
echo.
echo CSS and JS will be minified
echo.
:: Install NPM module to minify CSS
echo INSTALLING Gulp Clean CSS
call npm install gulp-clean-css --save-dev
echo DONE
echo.
:: Install NPM module to minify JS
echo INSTALLING Gulp Minify JS
call npm install --save-dev gulp-minify
echo DONE
echo.
:: Install NPM module to produce sourcemaps
echo INSTALLING Gulp Source Maps
call npm install gulp-sourcemaps
echo DONE
echo.
:: Install NPM module to rename files (Used for appending .min)
echo INSTALLING Gulp Rename
call npm install gulp-rename
echo DONE
echo.
:: Create gulp config file to minify CSS and JS
echo UPDATING Gulp Cofig File
echo. >> "gulpfile.js"
echo var cleanCSS = require('gulp-clean-css'); >> "gulpfile.js"
echo var minify = require('gulp-minify'); >> "gulpfile.js"
echo var sourcemaps = require('gulp-sourcemaps'); >> "gulpfile.js"
echo var rename = require('gulp-rename'); >> "gulpfile.js"
echo // Minify CSS >> "gulpfile.js"
echo gulp.task('minify-css', function() { >> "gulpfile.js"
echo     return gulp.src('./assets/stylesheets/*.css') >> "gulpfile.js"
echo         .pipe(sourcemaps.init()) >> "gulpfile.js"
echo         .pipe(cleanCSS({debug: true}, function(details) { >> "gulpfile.js"
echo             console.log(details.name + ': ' + details.stats.originalSize); >> "gulpfile.js"
echo             console.log(details.name + ': ' + details.stats.minifiedSize); >> "gulpfile.js"
echo         })) >> "gulpfile.js"
echo         .pipe(rename({ >> "gulpfile.js"
echo              suffix: '.min' >> "gulpfile.js"
echo         })) >> "gulpfile.js"
echo         .pipe(sourcemaps.write('./maps')) >> "gulpfile.js"
echo         .pipe(gulp.dest('./assets/stylesheets')); >> "gulpfile.js"
echo }); >> "gulpfile.js"
echo. >> "gulpfile.js"
echo // Minify JS >> "gulpfile.js"
echo gulp.task('compress-js', function() { >> "gulpfile.js"
echo   gulp.src('./assets/javascripts/*.js') >> "gulpfile.js"
echo     .pipe(sourcemaps.init()) >> "gulpfile.js"
echo     .pipe(minify({ >> "gulpfile.js"
echo         ext:{ >> "gulpfile.js"
echo             src:'.js', >> "gulpfile.js"
echo             min:'.min.js' >> "gulpfile.js"
echo         }, >> "gulpfile.js"
echo         exclude: ['tasks'], >> "gulpfile.js"
echo         ignoreFiles: ['.combo.js', '-min.js'] >> "gulpfile.js"
echo     })) >> "gulpfile.js"
echo     .pipe(sourcemaps.write('./maps')) >> "gulpfile.js"
echo     .pipe(gulp.dest('./assets/javascripts')) >> "gulpfile.js"
echo }); >> "gulpfile.js"
echo DONE
echo.
:: Run CSS minify command
echo COMPRESSING Stylesheets
call gulp minify-css
echo DONE
echo.
:: Run JS minify command
echo COMPRESSING JavaScript
call gulp compress-js
echo DONE
echo.

:: Delete all duplicate unminified files
:delete
echo.
echo ************************************************************
echo *                                                          *
echo *                 Removing Redundant Files                 *
echo *                                                          *
echo ************************************************************
echo.
echo CLEANING duplicate files
del  /S /Q "assets\stylesheets\fonts.css"
del  /S /Q "assets\stylesheets\fonts-ie8.css"
del  /S /Q "assets\stylesheets\govuk-template.css"
del  /S /Q "assets\stylesheets\govuk-template-ie6.css"
del  /S /Q "assets\stylesheets\govuk-template-ie7.css"
del  /S /Q "assets\stylesheets\govuk-template-ie8.css"
del  /S /Q "assets\stylesheets\govuk-template-print.css"
del  /S /Q "assets\stylesheets\main.css"
del  /S /Q "assets\stylesheets\main-ie6.css"
del  /S /Q "assets\stylesheets\main-ie7.css"
del  /S /Q "assets\stylesheets\main-ie8.css"
del  /S /Q "assets\stylesheets\ipo-print.css"
del  /S /Q "assets\stylesheets\ipo-fonts.css"
del  /S /Q "assets\javascripts\govuk-template.js"
del  /S /Q "assets\javascripts\ie.js"
echo DONE
echo.

:: Skip file additional deletion if developer
if "%role%" == "developer" (
  goto :pause

) else (
    goto :delete-additional
)

:: Delete all files not relevant to usage for user
:delete-additional
echo CLEANING Installation files
@RD /S /Q "assets\scss"
@RD /S /Q "node_modules"
del  /S /Q "gulpfile.js"
echo DONE
echo.

:: Go to end of script
echo.
echo Compiled CSS Avaliable In "frontend\assets\stylesheets"
echo.
goto :pause


:edit
echo.
echo.
echo.
echo.
echo "                                              "
echo " '||''''|       '||   ||    .                 "
echo "  ||  .       .. ||  ...  .||.                "
echo "  ||''|     .'  '||   ||   ||                 "
echo "  ||        |.   ||   ||   ||                 "
echo " .||.....|  '|..'||. .||.  '|.'               "
echo "                                              "
echo "                                              "
echo "     |                             .          "
echo "    |||     ....   ....    ....  .||.   ....  "
echo "   |  ||   ||. '  ||. '  .|...||  ||   ||. '  "
echo "  .''''|.  . '|.. . '|.. ||       ||   . '|.. "
echo " .|.  .||. |'..|' |'..|'  '|...'  '|.' |'..|' "
echo "                                              "
echo.
echo.
echo.
echo.

:: Setup prerequisites
echo.
echo ************************************************************
echo *                                                          *
echo *                      Prerequisites                       *
echo *                                                          *
echo ************************************************************
echo.

:: Set up frotend folder structure
echo CREATING frontend folder structure
md "IPO\assets\scss"
md "IPO\assets\css"
echo DONE
echo.

:: Create partial to import all screen css
echo CREATING main.scss
echo @import "govuk-elements-sass/govuk-elements"; > "ipo\assets\scss\main.scss"
echo @import "ipo-assets-frontend/ipo-screen-elements"; >> "ipo\assets\scss\main.scss"
echo DONE
echo.

:: Create partial to import all print css
echo CREATING ipo-print.scss
echo @import "ipo-assets-frontend/ipo-print-elements"; > "ipo\assets\scss\ipo-print.scss"
echo DONE
echo.

:: Create partial to import all font css
echo CREATING ipo-fonts.scss
echo @import "ipo-assets-frontend/ipo-fonts"; > "ipo\assets\scss\ipo-fonts.scss"
echo DONE
echo.


:: Move to working directory
echo.
cd IPO\assets
echo.

:: Download Assets
echo.
echo ************************************************************
echo *                                                          *
echo *                     Downloading Assets                   *
echo *                                                          *
echo ************************************************************
echo.
:: Install govuk-elements-sass and govuk_frontend_toolkit NPM modules (SCSS + JS + Images)
echo.
echo INSTALLING GovUK Elements Sass
call npm install govuk-elements-sass@2.1.2
echo DONE
echo.
:: Install ipo-assets-frontend NPM module (SCSS + Images)
echo.
echo INSTALLING IPO Template Sass
call npm i ipo-assets-frontend
echo DONE
echo.
echo DOWNLOAD SUCCESFUL
echo.

:: Import SCSS files
echo.
echo ************************************************************
echo *                                                          *
echo *                     Importing Files                      *
echo *                                                          *
echo ************************************************************
echo.
:: Copy scss files for IPO module
echo IMPORTING GovUK Template scss
xcopy "node_modules\ipo-assets-frontend\sass\" "scss\ipo-assets-frontend" /s
echo DONE
echo.
:: Copy scss files for GovUK frontend toolkit module
echo IMPORTING GovUK Frontend Toolkit Sass
xcopy "node_modules\govuk_frontend_toolkit\stylesheets\" "scss\govuk_frontend_toolkit" /s
echo DONE
echo.
:: Copy scss files for GovUK elements module
echo IMPORTING GovUK elements Sass
xcopy "node_modules\govuk-elements-sass\public\sass\" "scss\govuk-elements-sass" /s
echo DONE
echo.

:: Editing  _govuk-elements.scss paths
echo.
echo ************************************************************
echo *                                                          *
echo *           Changing GovUK Sass Partial Paths              *
echo *                                                          *
echo ************************************************************
echo.
echo CREATING file
echo // GOV.UK front end toolkit > "scss\govuk-elements-sass\_govuk-elements.scss"
echo // Sass variables, mixins and functions >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo // https://github.com/alphagov/govuk_frontend_toolkit/tree/master/stylesheets >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo. >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo // Settings (variables) >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo @import "../govuk_frontend_toolkit/colours";                                // Colour variables >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo @import "../govuk_frontend_toolkit/font_stack";                             // Font family variables >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo @import "../govuk_frontend_toolkit/measurements";                           // Widths and gutter variables >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo. >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo // Mixins >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo @import "../govuk_frontend_toolkit/conditionals";                           // Media query mixin >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo @import "../govuk_frontend_toolkit/device-pixels";                          // Retina image mixin >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo @import "../govuk_frontend_toolkit/grid_layout";                            // Basic grid layout mixin >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo @import "../govuk_frontend_toolkit/typography";                             // Core bold and heading mixins, also external links >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo @import "../govuk_frontend_toolkit/shims";                                  // Inline block mixin, clearfix placeholder >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo. >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo // Mixins to generate components (chunks of UI) >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo @import "../govuk_frontend_toolkit/design-patterns/alpha-beta"; >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo @import "../govuk_frontend_toolkit/design-patterns/buttons"; >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo @import "../govuk_frontend_toolkit/design-patterns/breadcrumbs"; >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo. >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo // Functions >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo @import "../govuk_frontend_toolkit/url-helpers";                            // Function to output image-url, or prefixed path (Rails and Compass only) >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo. >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo // GOV.UK elements >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo. >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo @import "elements/helpers";                       // Helper functions and classes >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo. >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo // Generic (normalize/reset.css) >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo @import "elements/reset"; >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo. >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo // Base (unclassed HTML elements) >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo // These are predefined by govuk_template >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo // If you're not using govuk_template, uncomment the line below. >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo // @import "elements/govuk-template-base";        // Base styles set by GOV.UK template >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo. >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo // Objects (unstyled design patterns) >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo @import "elements/layout";                        // Main content container. Grid layout - rows and column widths >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo. >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo // Components (chunks of UI) >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo @import "elements/elements-typography";           // Typography >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo @import "elements/buttons";                       // Buttons >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo @import "elements/icons";                         // Icons - numbered steps, calendar, search >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo @import "elements/lists";                         // Lists - numbered, bulleted >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo @import "elements/tables";                        // Tables - regular, numeric >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo @import "elements/details";                       // Details summary >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo @import "elements/panels";                        // Panels with a left grey border >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo @import "elements/forms";                         // Form - wrappers, inputs, labels >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo @import "elements/forms/form-block-labels";       // Chunky labels for radios and checkboxes >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo @import "elements/forms/form-date";               // Date of birth pattern >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo @import "elements/forms/form-validation";         // Errors and validation >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo @import "elements/breadcrumbs";                   // Breadcrumbs >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo @import "elements/phase-banner";                  // Alpha and beta banners and tags >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo @import "elements/components";                    // GOV.UK prefixed styles - blue highlighted box >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo @import "elements/shame";                         // Hacks and workarounds that will go away eventually >> "scss\govuk-elements-sass\_govuk-elements.scss"
echo.
echo DONE
echo.

:: Delete node_modules folder
echo.
echo ************************************************************
echo *                                                          *
echo *                 Removing Redundant Files                 *
echo *                                                          *
echo ************************************************************
echo.
echo CLEANING files
@RD /S /Q "node_modules"
echo.
echo DONE
echo.

:: Select Environment
echo.
echo ************************************************************
echo *                                                          *
echo *                    Select Environment                    *
echo *                                                          *
echo ************************************************************
echo.
:MENU
echo 1 - User - This will finish the installation.
echo 2 - Developer - This will start start the 'sass --watch' command ready for development.
echo.
SET /P EnvironmentType=Type 1 or 2 then press ENTER:
IF %EnvironmentType%==1 GOTO SassUser
IF %EnvironmentType%==2 GOTO SassDeveloper

:SassDeveloper
start cmd.exe @cmd /k "sass --watch scss:css"

:: Go to end of script
:SassUser
echo.
echo SASS And CSS Avaliable In "IPO\assets"
echo.
goto :pause


:pause
echo.
echo.
echo.
echo.
echo " '||'                   .           '||  '||            .    ||                   "
echo "  ||  .. ...    ....  .||.   ....    ||   ||   ....   .||.  ...    ...   .. ...   "
echo "  ||   ||  ||  ||. '   ||   '' .||   ||   ||  '' .||   ||    ||  .|  '|.  ||  ||  "
echo "  ||   ||  ||  . '|..  ||   .|' ||   ||   ||  .|' ||   ||    ||  ||   ||  ||  ||  "
echo " .||. .||. ||. |'..|'  '|.' '|..'|' .||. .||. '|..'|'  '|.' .||.  '|..|' .||. ||. "
echo "                                                                                  "
echo "                                                                                  "
echo "   ..|'''.|                             '||            .                          "
echo " .|'     '    ...   .. .. ..   ... ...   ||    ....  .||.    ....                 "
echo " ||         .|  '|.  || || ||   ||'  ||  ||  .|...||  ||   .|...||                "
echo " '|.      . ||   ||  || || ||   ||    |  ||  ||       ||   ||                     "
echo "  ''|....'   '|..|' .|| || ||.  ||...'  .||.  '|...'  '|.'  '|...'                "
echo "                                ||                                                "
echo "                               ''''                                               "
echo.
echo.
echo.
echo.
echo.
echo.
pause
:: SCRIPT COMPLETE
