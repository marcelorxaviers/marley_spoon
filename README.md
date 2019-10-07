### Requirements
  In order to clone and run the project you need to install:
  - [**Git**](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
  - [**Yarn**](https://yarnpkg.com/lang/en/docs/install/#mac-stable)
  - [**Ruby 2.6.4**](https://www.ruby-lang.org/en/documentation/installation/)
  - [**Bundler**](http://bundler.io/)

### Clone and prepare project
Using the command line run:
  1. `git clone https://github.com/marcelorxaviers/marley_spoon.git`
  2. `cd marley_spoon`
  3. `sh run_after_git_clone.sh`


### Running the specs
Using the command line - inside marley_spoon folder - run:
  1. `bundle exec rspec -fd`

### Running the program
Using the command line inside - marley_spoon folder - run:
  1. `RAILS_SERVE_STATIC_FILES=true RAILS_ENV=production bundle exec rails server`

Then open the [**Marley Spoon Application**](http://localhost:3000/) in your browser

### Plus
Checkout [**this video**](https://drive.google.com/open?id=16Fmx8Ytpx59EPlZqyKF3rOYCTpv_C6O-) showing how to run this application