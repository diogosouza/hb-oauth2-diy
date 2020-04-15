# README

Honeybadger's OAuth2 source code for Ruby and Rails project with Devise and [oauth-plugin](https://github.com/pelle/oauth-plugin).

Make sure to have Ruby 2.7 (or greater) installed in your machine.

### The provider

First, `cd` the `hb-oauth2-provider` folder and run:

```
bundle install
```

Then, start the server by running the `rails server` command.

Your provider app will be available at http://localhost:3000/.

### The consumer
In a different command line tab/window, `cd` the `hb-oauth2-consumer` folder and run:

```
bundle install
```

Then, run the client app by issuing the following command:

```
ruby app.rb
```

You app will be available at http://localhost:4567/.