# Plug [![Maintainability](https://api.codeclimate.com/v1/badges/6246b1cd8e42603c42f6/maintainability)](https://codeclimate.com/github/DigitalNZ/plug/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/6246b1cd8e42603c42f6/test_coverage)](https://codeclimate.com/github/DigitalNZ/plug/test_coverage) [![Build Status](https://travis-ci.org/DigitalNZ/plug.svg?branch=master)](https://travis-ci.org/DigitalNZ/plug)

A Rails engine to turn on/off features (Feature flipper).

### Features

- Supports Rails 3 and above
- MySQL
- Set notices

### Prerequisites

- Rails version 3 and above
- MySQL

### Getting Started

Add this line to your application's Gemfile:

```ruby
gem 'plug'
```

Execute:

```bash
→ bundle
```

And run the install generator:

```bash
→ rails g plug:install
→ rails g plug:install:migrations
→ rake plug:install:migrations # For Rails <= 3.x
→ rails db:migrate # Newer version of Rails
→ rake db:migrate # Older version of Rails
→ rails s
```

### Usage

Go to `localhost:3000/plug` and start creating features.

Use the provided method to check if the feature is enabled.

```ruby
Plug.enabled?('my-awesome-feature-slug')
```

If you wanted to restrict routes, you can use `Plug::Constraint` class

```ruby
Rails.application.routes.draw do
  resources :blog, constraint: Plug::Constraint.new('my-awesome-feature-slug')
end
```

Notices can be displayed using the `Plug.notice` method.

```erb
<%= Plug.notice('my-awesome-feature-slug') %>
```

If you have custom HTML for notice, you can pass a block.


```erb
<% Plug.notice('my-awesome-feature-slug') do |notice| %>
  <div class="alert">
    <p><%= notice %></p>
  </div>
<% end %>
```

#### Buttons
Add buttons to the config block to perform rake tasks from the plug dashboard

```ruby
  config.buttons = [
    { label: 'Clear cache', task: 'tmp:cache:clear' }
  ]
```

### Creating new migrations

```bash
→ rails g migration MyAwesomeMigration
→ rails g model MyModel name:string slug:string:index
→ rails db:migrate
→ rails db:migrate RAILS_ENV=test
→ rake plug:install:migrations # Run this on the app to copy the new migrations
```

### Running the tests

```bash
→ bundle exec rspec spec
```

### Publishing to `rubygems.org`

Make sure to bump the version. Rubygems don't accept version overrides.

```bash
→ gem build plug.gemspec
→ gem push plug-<version>.gem
```

### TODOs

- Ability to disable all features using one button
- Add screenshot
- Allow block parameters for `enabled?` method
- Versioning of features
- History of feature activities


### Questions/Issues?

File a new [issue](https://github.com/digitalnz/plug/issues/new) if you have questions or issues.

### Contributing

1. Fork it ( https://github.com/boost/digitalnz/fork )
2. Create your feature branch (`git checkout -b my-awesome-feature`)
3. Commit your changes (`git commit -am 'Add my awesome feature!'`)
4. Push to the branch (`git push origin my-awesome-feature`)
5. Create a new Pull Request
