class ProjectsController < ApplicationController
    def index
        @projects = Project.all
    end
      
    def show
        @project = Project.find(params[:id])
    end

    def new
        if (params[:project_id])
            new_todo
        else
            @project = Project.new
        end
    end

    def edit
        @project = Project.find(params[:id])
    end

    def create
        if (params[:project])
            @project = Project.new(title: params[:title])
          	if @project.save
          	     redirect_to @project
            else
                render 'new'
            end
        else
            new_todo
        end
    end

    def update
        @project = Project.find(params[:id])
 
        if @project.update(project_params)
            redirect_to @project
        else
            render 'edit'
        end
    end


    def destroy
        @project = Project.find(params[:id])
        @project.destroy
         
        redirect_to projects_path
    end

    def new_todo
        @todo = Todo.new(title: params[:title], isComplited: params[:isComplited])
        @todo.project = Project.find(params[:project_id])
        @todo.save
        redirect_to projects_path
    end

    private
        def project_params
            params.permit(:title, :project_id, :isComplited, :project)
            #params.require(:project).permit(:title)
        end
end
