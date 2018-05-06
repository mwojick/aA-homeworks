class BooksController < ApplicationController
  def index
    # your code here
    render json: Book.all

    # @books = Book.all
    # render :index
  end

  def new
    # your code here
    render :new

  end

  def create
    # your code here
    book = Book.new(book_params)

    if book.save 
      # render json: book 
      redirect_to books_url
    else 
      render json: book.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    # your code here
    book = Book.find_by(id: params[:id])

    if book.destroy
      # render json: book
      redirect_to books_url
    else
      render json: "Can't destroy this book."
    end 
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end



# class BooksController < ApplicationController
#   def index
#     @books = Book.all
#     # this render is optional; if we don't explicitly render or redirect,
#     # rails magic will automatically look for a corresponding index view
#     # and render it
#     render :index
#   end

#   def new
#     render :new
#   end

#   def create
#     book = Book.new(book_params)
#     if book.save
#       redirect_to books_url
#     else
#       flash.now[:errors] = book.errors.full_messages
#       render :new
#     end
#   end

#   def destroy
#     book = Book.find(params[:id])
#     book.destroy
#     redirect_to books_url
#   end

#   private
#   def book_params
#     params.require(:book).permit(:title, :author)
#   end
# end