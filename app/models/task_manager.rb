require 'yaml/store'
#allows us to store data in a specific file using YAML format,
#part of the Ruby standard library
require_relative 'task'

class TaskManager
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def create(task)
    #accepts a task hash ie params[:task]
    database.transaction do
      database['tasks'] ||= [] #find ['tasks'], if it DNE, create an empty array
      database['total'] ||= 0 #find database['total'] or assign it to zero
      database['total'] += 1 #increase count by one every time a new task is added
      database['tasks'] << {"id" => database['total'], "title" => task[:title],
      "description" => task[:description]}
    end
  end

  def raw_tasks
    database.transaction do
      database['tasks'] || []
    end
  end

  def all
    raw_tasks.map { |data| Task.new(data)}
  end

  def raw_task(id)
    raw_tasks.find { |task| task["id"] == id}
  end

  def find(id)
    Task.new(raw_task(id))
  end

end
