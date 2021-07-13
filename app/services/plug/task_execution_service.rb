# frozen_string_literal: true

require 'rake'

module Plug
  class TaskExecutionService
    attr_reader :name

    def initialize(name: nil)
      raise 'Task name is required' if name.nil?

      @name = name
    end

    def call
      Rails.application.load_tasks
      Rake::Task[name].execute
    end
  end
end
