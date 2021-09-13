module Api
  module V1
    class TasksController < ApplicationController
      def index
        @tasks = tasks

        render jsonapi: @tasks, status: :ok
      end

      def show
        @task = current_user.tasks.find(params[:id])
        
        render jsonapi: @task, status: :ok
      end
    
      def create
        @task = current_user.tasks.new(task_param)
    
        if @task.save
          render jsonapi: @task, status: :created
        else
          render jsonapi_errors: @task.errors
        end
      end
    
      def update
        @task = current_user.tasks.find(params[:id])
    
        if @task.update(task_param)
          render jsonapi: @task, status: :ok
        else
          render jsonapi_errors: @task.errors
        end
      end
    
      def destroy
        @task = current_user.tasks.find(params[:id])
        @task.destroy

        render jsonapi: @task
      end

      private

      def task_param
        params.require(:task).permit(:title, :completed, :note)
      end

      def tasks
        return current_user.tasks.completed.limit(default_limit) if params[:completed] == "true"
        return current_user.tasks.uncompleted.limit(default_limit) if params[:completed] == "false"

        current_user.tasks.limit(default_limit)
      end
    end
  end
end
