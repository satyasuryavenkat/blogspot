class ArticlesController < ApplicationController

    before_action :set_article, only: %i[ show edit update]

    def index 
        @articles = Article.order("created_at DESC").all
    end

    def my 
        @articles = Article.order("created_at DESC").all
    end

    def new 
        @article = Article.new 
    end

    def create
        @article = Article.new(article_params)
        
        respond_to do |format|
            if @article.save
              format.html { redirect_to '/', notice: "Article was successfully created." }
              format.json { render :show, status: :created, location: @article }
            else
              format.html { render :new, status: :unprocessable_entity }
              format.json { render json: @article.errors, status: :unprocessable_entity }
            end
          end
    end

    def show
    end

    def edit
    end

    def update
        respond_to do |format|
          if @article.update(article_params)
            format.html { redirect_to article_url(@article), notice: "Article was successfully updated." }
            format.json { render :show, status: :ok, location: @article }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @article.errors, status: :unprocessable_entity }
          end
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
    
        respond_to do |format|
          format.html { redirect_to '/', notice: "Article was successfully destroyed." }
          format.json { head :no_content }
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :description, :image, :user_id)
    end
end
