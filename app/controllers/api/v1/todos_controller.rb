class Api::V1::TodosController < ApplicationController
  def index
    todos = Todo.order(create_at: :desc)
    render json: { status: 'SUCCESS', message: 'Loaded posts', data: todos }
  end

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
