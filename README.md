# 🔌 Plug

A Rails engine to turn on/off features (Feature flipper).

### Features

- Supports Rails 3 and above
- MySQL
- Set notices (WIP)

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

### Questions/Issues?

File a new [issue](https://github.com/boost/plug/issues/new) if you have questions or issues.

### Contributing

1. Fork it ( https://github.com/boost/plug/fork )
2. Create your feature branch (`git checkout -b my-awesome-feature`)
3. Commit your changes (`git commit -am 'Add my awesome feature!'`)
4. Push to the branch (`git push origin my-awesome-feature`)
5. Create a new Pull Request