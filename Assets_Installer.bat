@echo off

echo CREATING frontend folder structure
md "frontend\assets\scss"
md "frontend\assets\stylesheets\external-links"
md "frontend\assets\stylesheets\font-awesome\css"
md "frontend\assets\stylesheets\font-awesome\fonts"
echo DONE

echo.

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

echo IMPORTING Styles To "main.scss"
echo // Import GovUK Sass > "frontend\assets\scss\main.scss"
echo @import "../../node_modules/govuk-elements-sass/public/sass/govuk-elements"; >> "frontend\assets\scss\main.scss"
echo. >> "frontend\assets\scss\main.scss"
echo // Path to assets for use with the file-url function >> "frontend\assets\scss\main.scss"
echo // in the govuk frontend toolkit's url-helpers partial >> "frontend\assets\scss\main.scss"
echo $path: "../../node_modules/govuk_frontend_toolkit/images/"; >> "frontend\assets\scss\main.scss"
echo. >> "frontend\assets\scss\main.scss"
echo // Import IPO Sass >> "frontend\assets\scss\main.scss"
echo @import "../../node_modules/ipo-assets-frontend/sass/ipo-elements.scss"; >> "frontend\assets\scss\main.scss"
echo DONE

echo.

echo PREPARING IE6 Specific Style Sheet
echo $is-ie: true; > "frontend\assets\scss\main-ie6.scss"
echo $ie-version: 6; >> "frontend\assets\scss\main-ie6.scss"
echo $mobile-ie6: false; >> "frontend\assets\scss\main-ie6.scss"
echo. >> "frontend\assets\scss\main-ie6.scss"
echo @import "main"; >> "frontend\assets\scss\main-ie6.scss"
echo DONE

echo.

echo PREPARING IE7 Specific Style Sheet
echo $is-ie: true; > "frontend\assets\scss\main-ie7.scss"
echo $ie-version: 7; >> "frontend\assets\scss\main-ie7.scss"
echo. >> "frontend\assets\scss\main-ie7.scss"
echo @import "main"; >> "frontend\assets\scss\main-ie7.scss"
echo DONE

echo.

echo PREPARING IE8 Specific Style Sheet
echo $is-ie: true; > "frontend\assets\scss\main-ie8.scss"
echo $ie-version: 8; >> "frontend\assets\scss\main-ie8.scss"
echo. >> "frontend\assets\scss\main-ie8.scss"
echo @import "main"; >> "frontend\assets\scss\main-ie8.scss"
echo DONE

cd frontend
echo.

echo INSTALLING GovUK Elements Sass
call npm install govuk-elements-sass
echo DONE

echo.

echo INSTALLING GovUK Template CSS
call npm i govuk_template_ejs
echo DONE

echo.

echo INSTALLING IPO Template Sass
call npm install ipo-assets-frontend
echo DONE

echo.

echo INSTALLING Local Gulp
call npm install --save-dev gulp
echo DONE

echo.

echo INSTALLING Gulp Sass Dependency
call npm install gulp-sass --save-dev
echo DONE

echo.

echo INSTALLING Font Awesome
call npm install font-awesome
echo DONE

echo.

echo IMPORTING GovUK Template CSS
xcopy /s "node_modules\govuk_template_ejs\assets" "assets"
echo DONE

echo IMPORTING IPO Images
xcopy /s "node_modules\ipo-assets-frontend\images" "assets\images"
xcopy /s "node_modules\ipo-assets-frontend\external-links" "assets\stylesheets\external-links"
echo DONE

echo IMPORTING Font Awesome
xcopy /s "node_modules\font-awesome\css\font-awesome.min.css" "assets\stylesheets\font-awesome\css"
xcopy /s "node_modules\font-awesome\css\font-awesome.css.map" "assets\stylesheets\font-awesome\css"
xcopy /s "node_modules\font-awesome\fonts" "assets\stylesheets\font-awesome\fonts"
echo DONE

echo.

echo COMPILING CSS
call gulp styles
echo DONE

echo.

:choice
set /P c=Do you want to keep the development environment? (Y/N)
if /I "%c%" EQU "Y" goto :developer
if /I "%c%" EQU "N" goto :user
goto :choice

:user
echo.
echo #################### USER Mode Selected ####################
echo.
echo CSS and JS will be minified
echo.
echo INSTALLING Gulp Clean CSS
call npm install gulp-clean-css --save-dev
echo DONE
echo.
echo INSTALLING Gulp Minify JS
call npm install --save-dev gulp-minify
echo DONE
echo.
echo INSTALLING Gulp Source Maps
call npm install gulp-sourcemaps
echo DONE
echo.
echo INSTALLING Gulp Rename
call npm install gulp-rename
echo DONE
echo.
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
echo Compressing CSS
call gulp minify-css
echo.
echo Compressing JS
call gulp compress-js
echo.
echo CLEANING Installation Files
@RD /S /Q "assets\scss"
@RD /S /Q "node_modules"
del  /S /Q "gulpfile.js"
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
del  /S /Q "assets\javascripts\govuk-template.js"
del  /S /Q "assets\javascripts\ie.js"
echo DONE
echo.
echo INSTALLATION COMPLETE - Compiled CSS Avaliable In "frontend\assets\stylesheets"
echo.
goto :pause

:developer
echo.
echo #################### DEVELOPER Mode Selected ####################
echo.
echo Configuration files have been maintained
echo.
echo INSTALLATION COMPLETE - Compiled CSS Avaliable In: "frontend\assets\stylesheets"
echo.
echo To rebuild "main.css" run the command "gulp styles" from the "frontend" folder
echo.
echo For additional help visit: "https://github.com/alphagov/govuk_elements"
echo.
goto :pause

:pause
pause
