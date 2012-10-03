require 'spec_helper'

describe Admin::AuthorsController do
  login_admin

  ########
  # INDEX
  ########
  describe '#INDEX' do
    it 'assings all author in @author' do
      @author = FactoryGirl.create(:author)
      get :index, { use_route: :admin }
      assigns[:authors].should eq([@author])
    end
  end

  describe 'GET new' do
    it 'assingn author in @author' do
      get :new, { use_route: :admin }
      assigns[:author].should be_a_new(Author)
    end
  end

  ########
  # SHOW
  # ######
  describe '#SHOW' do
    before(:each) do
      @author = FactoryGirl.create(:author)
      get :show, {id: @author, use_route: :admin}
    end
    it 'assings author in @author' do
      assigns[:author].should eq(@author)
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
      @author = FactoryGirl.create(:author)
      get :edit, {id: @author, use_route: :admin }
    end

    it 'assing author in @author' do
      assigns[:author].should eq(@author)
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

      it 'saves the new author in database' do
        expect{ post :create, { author: FactoryGirl.attributes_for(:author) }}.to change(Author, :count).by(1)
      end

      it 'redirects to the show page' do
        @author = FactoryGirl.attributes_for(:author)
        post :create, { author: @author, use_route: :admin	}
        response.should redirect_to Author.last
      end

    end

    context 'with invalid attributes' do

      it 'not saves the new author in database' do
        expect{ post :create, { author: FactoryGirl.build(:invalid_author), use_route: :admin }}.to_not change(Author, :count)
      end

      it 're-render the new author template' do
        @author = FactoryGirl.build(:author)
        post :create, { author: @author, use_route: :admin }
        response.should render_template(:new)
      end

    end

  end


  ########
  # UPDATE
  ########
  describe '#UPDATE' do

    before(:each) do
      @author = FactoryGirl.create(:author)
    end

    context 'with valid attributes' do

      before(:each) do
        put :update, { id: @author, author: FactoryGirl.attributes_for(:author, name: 'Somebody'), use_route: :admin }
      end

      it 'locate the request author' do
        assigns[:author].should eq(@author)
      end

      it 'change @author attributes' do
        @author.reload
        @author.name.should eq('Somebody')
      end

      it 'redirect to the uploaded author' do
        response.should redirect_to(author_path(@author))
      end

    end

    context 'with invalid attributes' do

      before(:each) do
        put :update, { id: @author, author: FactoryGirl.attributes_for(:invalid_author), use_route: :admin }
      end

      it 'locate the request author' do
        assigns[:author].should eq(@author)
      end

      it 'does not change @author attributes' do
        response.should_not eq(@author)
      end

      it 're-render edit author template' do
        response.should render_template(:edit)
      end

    end	

  end


  ########
  # DESTROY
  ########
  describe '#DESTROY' do

    before(:each) do
      @author = FactoryGirl.create(:author)
      delete :destroy, { id: @author, use_route: :admin }
    end

    it 'assign author in @author' do
      assigns[:author].should eq(@author)
    end

    it 'redirect to author list' do
      response.should redirect_to(authors_path)
    end

  end

end
