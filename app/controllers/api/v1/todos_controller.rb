class Api::V1::TodosController < ApplicationController
  # 一覧画面を表示する
  def index
    # binding.pry
    todos = Todo.all
    render json: { status: 'SUCCESS', message: 'Loaded posts', data: todos }
  end

  #Todoリストを作成する
  def create
    todo = Todo.new(todo_params)
    if todo.save
      render json: { status: 'SUCCESS', data: todo }
    else
      render json: { status: 'ERROR', data: todo.errors }
    end
  end

  private
  def todo_params
    params.require(:todo).permit(:title, :detail, :label)
  end
end
