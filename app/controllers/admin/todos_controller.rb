class Admin::TodosController < Admin::Base
	before_action :check_authority, except: [:index, :new, :create]

    def index
    end

    def show
        @todo = Todo.find_by(id: params[:id])
    end

		def new
				@todo = Todo.new
		end

    def create
				todo = Todo.new
				todo.assign_attributes(todo_params)
				todo.user = current_user
				if todo.save
					redirect_to [:admin, :todos], notice: "TODOを作成しました"
				else
				end
    end

    def update
				todo = Todo.find(params[:id])
				todo.assign_attributes(todo_params)
				if todo.save
					redirect_to [:admin, :todos], notice: "TODOを更新しました"
				else
				end
    end

    def destroy
				Todo.find_by(id: params[:id]).destroy
				redirect_to :back, notice: "TODOを完了にしました"
    end

private
		def todo_params
				allows = [:title, :memo, :end_day, :exist_end_day]
				params.require(:todo).permit(allows)
		end

def check_authority
	todo = Todo.find(params[:id])
	redirect_to :root, notice: "権限がありません" unless todo.user == current_user
end

end
