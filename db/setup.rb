require 'bundler'
Bundler.require

databases = [Sequel.postgres("task_manager"),
             Sequel.postgres("task_manager_test")]

databases.each do |database|
  database.create_table :tasks do
    primary_key :id
    String      :title, :size => 255
    String      :description, :size => 255
  end
end

#this is a migration; interacts w/ structure of db
#after created run from command line to create these tables 
