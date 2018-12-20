class TodosController < ApplicationController

	def show
		@todo = Todo.find(params[:id])
        @project = Project.where(id: @todo.project_id)
    end

	def edit
        @todo = Todo.find(params[:id])
        p @todo
    end

	def create
    	@project = Project.find(params[:project_id])
    	@todo = @project.todos.create(todo_params)
    	redirect_to project_path(@project)
	end
 
	def update
		@projects = Project.all
 		@todo = Todo.find(params[:id])

        if @todo.update(todo_params)
            redirect_to project_path(@todo.project_id)
        else
            render 'edit'
        end
    end

  	private
    	def todo_params
      		params.require(:todo).permit(:title, :isComplited)
    	end
end
