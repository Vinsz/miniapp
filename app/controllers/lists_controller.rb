class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  # GET /lists
  # GET /lists.json
  def index
    #exibe somente as listas do usuário logado
    @lists = List.all.where(user_id: current_user)
  end

  def favoritas
    #dados para exibir somente as listas favoritas do usuário e enviar para visualização da lista no show dos favoritos
    @favs = Favorite.joins(:list).select("favorites.id, lists.name, lists.id as lid").where(user_id: current_user)
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
    #pega as tasks abertas
    @abertas = Task.where(active: true, list_id: params[:id])
    #pega as tasks fechadas
    @fechadas = Task.where(active: false, list_id: params[:id])
  end

  def publicas
    #só apresenta listas com status=true, ou seja, publicas
    @status = List.status(true) 
  end

  # GET /lists/new
  def new
    @list = List.new
    4.times {@list.tasks.build}
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists
  # POST /lists.json
  def create
    @list = List.new(list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: 'Lista criada.' }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: 'Lista atualizada.' }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_url, notice: 'Lista apagada.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:user_id, :name, :public, tasks_attributes: [:id, :text, :active, :_destroy])
    end
end
