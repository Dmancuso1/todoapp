class TodosController < ApplicationController
  before_action :set_todo, only: [:edit, :update, :show, :destroy]

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      flash[:notice] = "Todo was created successfully!"
      redirect_to todo_path(@todo)
    else
      render 'new'
    end
  end

  def show
    # set_todo is running here as before action
  end
  
  def edit
    # set_todo is running here as before action
  end

  def update
    # set_todo is running here as before action
    if @todo.update(todo_params)
      flash[:notice] = "Todo was successfully updated"
      redirect_to todo_path(@todo)
    else
      render 'edit'
    end
  end

  def index
    @todos = Todo.all
  end

  def destroy
    # set_todo is running here as before action
    @todo.destroy
    flash[:notice] = "Todo was deleted successfully"
    redirect_to todos_path
  end





  private

  def set_todo
    @todo = Todo.find(params[:id])
  end

  # to whitelist params from the web.
  def todo_params
    params.require(:todo).permit(:name, :description)  
  end


end
