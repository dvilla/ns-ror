require 'spec_helper'

describe BooksController do

  ########
  # INDEX
  ########
  describe '#INDEX' do
    it 'assings all books in @books' do
      @book = FactoryGirl.create(:book)
      get :index, use_route: :ns_library
      assigns[:books].should eq([@book])
    end
  end

  describe 'GET new' do
    it 'assingn book in @book' do
      get :new, {use_route: :ns_library}
      assigns[:book].should be_a_new(Book)
    end
  end

  ########
  # SHOW
  # ######
  describe '#SHOW' do
    before(:each) do
      @book = FactoryGirl.create(:book)
      get :show, {id: @book, use_route: :ns_library}
    end
    it 'assings book in @book' do
      assigns[:book].should eq(@book)
    end

    it 'render the show template' do
      response.should render_template('show')
    end
  end


  ########
  # EDIT
  ########

  describe '#EDIT' do

    before(:each) do
      @book = FactoryGirl.create(:book)
      get :edit, {id: @book, use_route: :ns_library }
    end

    it 'assing book in @book' do
      assigns[:book].should eq(@book)
    end

    it 'render edit template' do
      response.should render_template('edit')
    end
  end


  ########
  # CREATE
  ########
  describe 'POST create' do

    context 'with valid attributes' do

      it 'saves the new book in database' do
        expect{ post :create, { book: FactoryGirl.attributes_for(:book), use_route: :ns_library }}.to change(Book, :count).by(1)
      end

      it 'redirects to the show page' do
        @book = FactoryGirl.attributes_for(:book)
        post :create, { book: @book, use_route: :ns_library	}
        response.should redirect_to Book.last
      end

    end

    context 'with invalid attributes' do

      it 'not saves the new book in database' do
        expect{ post :create, { book: FactoryGirl.build(:invalid_book), use_route: :ns_library }}.to_not change(Book, :count)
      end

      it 're-render the new book template' do
        @book = FactoryGirl.build(:book)
        post :create, { book: @book, use_route: :ns_library }
        response.should render_template(:new)
      end

    end

  end


  ########
  # UPDATE
  ########
  describe '#UPDATE' do

    before(:each) do
      @book = FactoryGirl.create(:book)
    end

    context 'with valid attributes' do

      before(:each) do
        put :update, { id: @book, book: FactoryGirl.attributes_for(:book, title: 'The new world'), use_route: :ns_library }
      end

      it 'locate the request book' do
        assigns[:book].should eq(@book)
      end

      it 'change @book attributes' do
        @book.reload
        @book.title.should eq('The new world')
      end

      it 'redirect to the uploaded book' do
        response.should redirect_to(book_path(@book))
      end

    end

    context 'with invalid attributes' do

      before(:each) do
        put :update, { id: @book, book: FactoryGirl.attributes_for(:invalid_book), use_route: :ns_library }
      end

      it 'locate the request book' do
        assigns[:book].should eq(@book)
      end

      it 'does not change @book attributes' do
        response.should_not eq(@book)
      end

      it 're-render edit book template' do
        response.should render_template(:edit)
      end

    end	

  end


  ########
  # DESTROY
  ########
  describe '#DESTROY' do

    before(:each) do
      @book = FactoryGirl.create(:book)
      delete :destroy, { id: @book, use_route: :ns_library }
    end

    it 'assign book in @book' do
      assigns[:book].should eq(@book)
    end

    it 'redirect to books list' do
      response.should redirect_to(books_path)
    end

  end

end
