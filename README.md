# AutomaticFood
Automates your healthy lunch. Get meals that fit your health and performance goals perfectly right to your doorstep and save at least 2 hours per week

## Installation
1. clone the repo
1. `cd speedrail && bundle` (installs dependencies)
1. `rails g rename:into new_app_name` (then `cd ../new_app_name` to refresh)
1. remove `gem 'rename'` from Gemfile, then `bin/setup` to create DB
1. `bundle exec figaro install`
1. `cp config/application-sample.yml config/application.yml` (put ENV vars here)
1. `rm -rf .git && git init && git add . && git commit -m 'first commit'` to remove git references to this repo and reinitialize git

## Development
```sh
bin/dev # uses foreman to boot server, frontend, and bg job queue
```

**troubleshooting**

ActionCable - to support WebSockets, run `rails g channel channel_name --assets` then add `mount ActionCable.server => '/cable'` to `config/routes.rb`. update `cable.yml` -> `production:` to include the following for Heroku to connect w/ Redis for `ActionCable.broadcast`:

```
ssl_params:
    verify_mode: <%= OpenSSL::SSL::VERIFY_NONE %>
```

`Turbo Drive` lazy-loads pages following form submission, causing script tags at the bottom of following views to not always load.

```html
<!-- add data-turbo=false to form submission buttons if the following view needs a full render -->
<button data-turbo="false" type="submit" ...>Submit</button>
```

## Testing
```
bundle exec rspec # run all tests inside spec/
bundle exec rspec spec/dir_name # run all tests inside given directory
```

## Deploying
```sh
figaro heroku:set -e production # you only need to do this once
heroku git:remote -a heroku_app_name_here # you only need to do this once
```

```sh
git push heroku master # deploys master branch
git push heroku some_branch_name:master # deploys non-master branch
```

**note**: Heroku must have 2 'dynos' enabled, `web` + `worker`, to process background jobs. if you don't need a queue, simply remove the `worker` task from `Procfile` and don't invoke `.delayed` functions.
