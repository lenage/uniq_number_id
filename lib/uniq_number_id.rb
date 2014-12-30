require "active_model"
require 'securerandom'
require "uniq_number_id/version"

module UniqNumberId
  extend ActiveSupport::Concern

  # Example using Active Record:
  #
  #   # Schema: User(member_number:integer)
  #   class User < ActiveRecord::Base
  #     uniq_number_id :member_number, length: 5
  #   end
  #
  #   user = User.new
  #   user.save
  #   user.member_number # => 17263
  #   user.renew_member_number # => true, will update member_number with a new number
  #

  module ClassMethods
    def uniq_number_id(*args)
      include InstanceMethodsOnCallback
      cattr_accessor :number_columns, :options
      options = args.extract_options!

      length = options.fetch(:length, 8)
      bytes = ((length*3.0)/2.0)
      bytes = 8 if bytes < 8

      args.each do |attr|
        define_method("renew_#{attr}") do
          send(:generate_uniq_number_id, attr, bytes, length)
          save
        end
      end

      before_create do
        args.each do |attr|
          self.generate_uniq_number_id(attr, bytes, length)
        end
      end
    end
  end

  module InstanceMethodsOnCallback
    #TODO: support generate random number bases on attr type
    #      for example, if attr DB type is integer, then generate integer
    #                   if attr DB type is String, then generate hex string
    def generate_uniq_number_id(attr, bytes, length)
      self.send("#{attr}=", loop do
                  random_number = SecureRandom.random_bytes(bytes).unpack('N')[0]
                  random_number = random_number.to_s[0..length-1].to_i
                  break random_number unless self.class.exists?(attr => random_number)
                end)
    end
  end

  ActiveSupport::on_load(:active_record) do
    include UniqNumberId
  end
end
