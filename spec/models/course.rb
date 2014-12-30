class Course
  extend ActiveModel::Callbacks
  include ActiveModel::Validations
  include UniqNumberId

  define_model_callbacks :create
  attr_accessor :course_code
  uniq_number_id :course_code, length: 10

  def self.exists?(attrs)
    false
  end

  def save
    true
  end
end
