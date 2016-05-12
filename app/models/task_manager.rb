require 'yaml/store'

class TaskManager
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def create(task)
    table.insert(title: task[:title], description: task[:description])
    #functionality for creating unique ids is built into sequel
  end

  def table
    database.from(:tasks).order(:id)
  end

  # def raw_tasks
  #   database.transaction do
  #     database['tasks'] || []
  #   end
  # end
  #with sequql, table now represents all tasks

  def all
    raw_tasks.map { |data| Task.new(data)}
  end

  def raw_task(id)
    # raw_tasks.find { |task| task["id"] == id}
    table.where(:id => id).to_a[0]
  end

  def find(id)
    Task.new(raw_task(id))
  end

  def update(id, task)
    database.transaction do
      target_task = database['tasks'].find { |data| data["id"] == id }
      target_task['title'] = task[:title]
      target_task['description'] = task[:description]
    end
  end

  def destroy(id)
    database.transaction do
      database["tasks"].delete_if {|task| task["id"] == id }
    end
  end

  def delete_all
    # database.transaction do
    #   database['tasks'] = []
    #   database['total'] = 0
    # end
    
  end

end
