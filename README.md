# AppRail::Steps

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/app_rail/steps`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'app_rail-steps'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install app_rail-steps

## Usage

```ruby
#require the gem in your script
require 'app_rail/steps'

...
#inside your module/class include the displayable modile
include AppRail::Steps::Displayable

...
#now you can use the methods from the gem for example:
def ar_list_item_as_json
      ar_core_list_item(id: self.id, text: self.name, detail_text: self.detail_text)
end


```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/FutureWorkshops/app_rail-steps.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
