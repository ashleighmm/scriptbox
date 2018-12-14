#!/bin/bash
###Script to install node and npm on network user's profile

### Install Node & npm
echo "Installing Node.js and npm";
sudo apt install npm
sudo apt install nodejs
sudo node -v
sudo npm -v

# Uninstall previous Gulp installation and related packages, if any
sudo npm rm gulp -g
sudo npm rm gulp-cli -g
# Install gulp locally in current working directory
sudo npm rm gulp --save-dev
sudo npm cache clean

# Install the latest Gulp CLI tools globally
sudo npm install gulpjs/gulp-cli -g

# Install Gulp 4 into your project from 4.0 GitHub branch as dev dependency
sudo npm install gulp@next --save-dev

# Check the versions installed. Make sure your versions are 2.0.1 + or 4.0.0
gulp -v

echo "Please enter your website name:"
read WEBSITENAME;

### Write gulpfile
### Gulp performs mulitple tasks for developers to make use of durung the development phase, in their own local environment. The ### following will be installed:
### 
cat <<EOT >> gulpfile.js
const autoprefixer = require('gulp-autoprefixer');
const browserSync = require('browser-sync');
const cssnano = require('gulp-cssnano');
const eslint = require('gulp-eslint');
const gulp = require('gulp');
const prettyError = require('gulp-prettyerror');
const rename = require('gulp-rename');
const sass = require('gulp-sass');
const sourcemaps = require('gulp-sourcemaps');
const terser = require('gulp-terser');

// Create basic Gulp tasks

gulp.task('sass', function(done) {
  gulp
    .src('./sass/style.scss', { sourcemaps: true })
    .pipe(sourcemaps.init())
    .pipe(prettyError())
    .pipe(sass())
    .pipe(
      autoprefixer({
        browsers: ['last 2 versions']
      })
    )
    .pipe(gulp.dest('./build/css'))
    .pipe(cssnano())
    .pipe(rename('style.min.css'))
    .pipe(sourcemaps.write('../maps'))
    .pipe(gulp.dest('./build/css'));

  gulp
    .src('./sass/style-stretch.scss', { sourcemaps: true })
    .pipe(sourcemaps.init())
    .pipe(prettyError())
    .pipe(sass())
    .pipe(
      autoprefixer({
        browsers: ['last 2 versions']
      })
    )
    .pipe(gulp.dest('./build/css'))
    .pipe(cssnano())
    .pipe(rename('style-stretch.min.css'))
    .pipe(sourcemaps.write('../maps'))
    .pipe(gulp.dest('./build/css'));

  done();
});

gulp.task('lint', function() {
  return (
    gulp
      .src(['./js/*.js'])
      // Also need to use it here...
      .pipe(prettyError())
      .pipe(eslint())
      .pipe(eslint.format())
      .pipe(eslint.failAfterError())
  );
});

gulp.task(
  'scripts',
  gulp.series('lint', function() {
    return gulp
      .src('./js/*.js')
      .pipe(terser())
      .pipe(
        rename({
          extname: '.min.js'
        })
      )
      .pipe(gulp.dest('./build/js'));
  })
);

// Set-up BrowserSync and watch

gulp.task('browser-sync', function(done) {
  browserSync.init({
    server: {
      baseDir: './'
    }
  });

  gulp
    .watch(['build/css/*.css', 'build/js/*.js'])
    .on('change', browserSync.reload);

  done();
});

gulp.task('watch', function(done) {
  gulp.watch('js/*.js', gulp.series('scripts'));
  gulp.watch('sass/*.scss', gulp.series('sass'));
  done();
});

gulp.task('default', gulp.parallel('browser-sync', 'watch'));

EOT

### Write package.json file. When this has been installed, npm install uses it to check which packages and versions it needs to grab from the package manager library on the npm repository online and install them in the current website directory. 
cat <<EOT >> package.json
{
  "name": "$WEBSITENAME",
  "version": "1.0.0",
  "description": "$WEBSITENAME",
  "dependencies": {},
  "devDependencies": {
    "browser-sync": "^2.23.6",
    //"gulp": "^4.0.0",
    "gulp-autoprefixer": "^4.1.0",
    "gulp-cssnano": "^2.1.2",
    "gulp-eslint": "^4.0.2",
    "gulp-prettyerror": "^1.2.1",
    "gulp-rename": "^1.2.2",
    "gulp-sass": "^3.1.0",
    "gulp-sourcemaps": "^2.6.4"
  },
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "prettier": {
    "singleQuote": true
  },
  "author": "$WEBSITENAME",
  "license": "ISC"
}
EOT

### Installs necessary packages listed in the package.json file
npm install
npm install gulp
npm install gulp-autoprefixer
npm install browser-sync
npm install gulp-sass
npm install gulp-cssnano
npm install gulp-prettyerror
npm install gulp-sourcemaps
npm install gulp-rename
npm install gulp-terser
npm install gulp-eslint



