class User
  extend ActiveModel::Callbacks
  include ActiveModel::Validations
  include UniqNumberId

  define_model_callbacks :create
  attr_accessor :member_number
  uniq_number_id :member_number, length: 8

  def self.exists?(attrs)
    false
  end

  def save
    true
  end
end
