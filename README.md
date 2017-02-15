== README

[![Build Status](https://travis-ci.org/awkale/prn_product.svg?branch=feature%2FPRND-18%2Fuser_roles)](https://travis-ci.org/awkale/prn_product)

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
`2.2.2`

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite
`rspec`
* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
Automatic deploys are enabled for a GitHub branc, Heroku will build and deploy all pushes to that branch. For example, the development(stage) app on Heroku,  pushes to your GitHub `development` branch will be automatically built and deployed to that app. Travis CI is active, so all deploys will wait for all tests to pass before deploying.

`git push origin develop`
`git push origin master`
* ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
