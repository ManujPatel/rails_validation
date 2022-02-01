class AddTermsofusageToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :terms_of_usage, :boolean, :default => false,
  end
end
