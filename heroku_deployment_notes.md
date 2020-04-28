# Deploying through Heroku

1. Go to heroku and sign up
2. then go to: [https://devcenter.heroku.com/articles/getting-started-with-rails6]
   and install heroku cli tool `brew tap heroku/brew && brew install heroku` for mac
   and for linux `sudo snap install --classic heroku` 👈 if this command does not work for
   ubuntu, scroll further down at the page and you will see `curl https://cli-assets.heroku.com/install-ubuntu.sh | sh`
   run it, which we are running things from internet, which is an http request to install-ubuntu and we are piping it to 'sh'. You have to be careful when you do that, I trust heroku but, they could have been hacked, who knows.
   Note: follow the steps to run and login heroku in your terminal - `heroku autocomplete --refresh-cache` then - `heroku autocomplete`

3. Deploying to heroku steps:
   After installing heroku cli tool, we can:

   1. login in terminal by running `heroku login` which will redirect us to
      browser and once you login there, the logging in will be done in your local terminal too
   2. Dealing with database

   In the `config` folder there is `database.yml` file (yml: Yet another Markup Language) which is whitespace sensitive like python
   so anything indented below something, it belongs to it like a JSON object but, it does not use curly braces or quotations
   `/config/database.yml` and from this link (`https://devcenter.heroku.com/articles/getting-started-with-rails6`) go down to find
   `database.yml` configuration for production mode

   Note: if you are using `sqlite` gem instead of postgres(`pg`), you will need to use pg for production
   so, move the `sqlite` gem into development gems and add `pg` to production group gems then do `bundle install`
   if `bundle install` fails and asks for installing postgres header files which is `libpg-dev` then run the following commands:
   `cd ~`
   `sudo apt-get update`
   `sudo apt-get upgrade`
   `sudo apt-get install zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev libffi-dev libpq-dev`

   3. run `heroku create` command which creates some random sub-domain at heroku.com but, we can also
      request a particular name by running `heroku apps:create <a-unique-name>` then visit the link that
      is generated which is where our app is going for deployment.

   4. Now if you run `git remote -v`, you have a remote now called heroku as well so:

      1. to push to github run: `git push origin master`
      2. to push to heroku run: `git push heroku master`

      so go ahead and push it to heroku. So that, take all my code and push it to heroku.
      and then heroku has got some git hooks in place where it is detecting that it is
      a ruby app specifically rails and start installing my gems, so, it is going into
      my GemFile and install gems. It will then detect my package.json file and will
      do `yarn install` and install any javascript dependencies that are required

   5. With heroku command we can run all rails commands like
      1. `heroku run rails db:prepare` 'prepare' is a new rails command which if the database
         does not exist, it gonna create it and appropriate tables not by stepping through
         our migrations but, by looking at our database schema file and make them all at once
      2. `heroku run rails db:seed`
