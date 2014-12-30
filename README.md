# UniqNumberId

Create uniques random number id for any model in ruby on rails.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'uniq_number_id'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install uniq_number_id

## Usage

Example using Active Record:

```ruby
# Schema: User(member_number:integer)
class User < ActiveRecord::Base
uniq_number_id :member_number, length: 5 # default length 8
end

user = User.new
user.save
user.member_number # => 17263
user.renew_member_number # => true, will update member_number with a new number
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/uniq_number_id/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
