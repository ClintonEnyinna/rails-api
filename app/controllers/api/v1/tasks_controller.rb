module Api
  module V1
    class TasksController < ApplicationController
      def index
        @tasks = tasks

        render jsonapi: @tasks, status: :ok
      end

      def show
        @task = Task.find(params[:id])
        
        render jsonapi: @task, status: :ok
      end
    
      def create
        @task = Task.new(task_param)
    
        if @task.save
          render jsonapi: @task, status: :created
        else
          render jsonapi_errors: @task.errors
        end
      end
    
      def update
        @task = Task.find(params[:id])
    
        if @task.update(task_param)
          render jsonapi: @task, status: :ok
        else
          render jsonapi_errors: @task.errors
        end
      end
    
      def destroy
        @task = Task.find(params[:id])
        @task.destroy

        render jsonapi: @task
      end

      private

      def task_param
        params.require(:task).permit(:title, :completed, :note)
      end

      def tasks
        return Task.completed.limit(default_limit) if params[:completed] == "true"
        return Task.uncompleted.limit(default_limit) if params[:completed] == "false"

        Task.limit(default_limit)
      end
    end
  end
end