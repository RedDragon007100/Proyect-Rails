class ArticulosController < ApplicationController
  def new
    @articulo = Articulo.new
  end

  def create
    @articulo = Articulo.new(params.require(:articulo).permit(:title, :text))
    # retorna un boolean indicando si fue creado o no.
    @articulo.save
    redirect_to @article
  end

  def show
    @articulo = Articulo.find(params[:id])
  end

  def index
    @articulos = Articulo.all
  end

  def create
    @articulo = Articulo.new(articulo_params)
    if @articulo.save
        redirect_to @articulo
    else
      render 'new'
    end
  #  render plain: params[:articulo].inspect
  end

  def edit
    @articulo = Articulo.find(params[:id])
  end

  def update
    @articulo = Articulo.find(params[:id])
    if @articulo.update(articulo_params)
      redirect_to @articulo
    else
      render 'edit'
    end
  end

  private
    def articulo_params
      params.require(:articulo).permit(:title, :text)
    end
end
