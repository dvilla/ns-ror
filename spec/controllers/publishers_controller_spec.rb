require 'spec_helper'

describe PublishersController do

  ########
  # INDEX
  ########
  describe '#INDEX' do
    it 'assings all publisher in @publisher' do
      @publisher = FactoryGirl.create(:publisher)
      get :index
      assigns[:publishers].should eq([@publisher])
    end
  end

  describe 'GET new' do
    it 'assingn publisher in @publisher' do
      get :new
      assigns[:publisher].should be_a_new(Publisher)
    end
  end

  ########
  # SHOW
  # ######
  describe '#SHOW' do
    before(:each) do
      @publisher = FactoryGirl.create(:publisher)
      get :show, {id: @publisher }
    end
    it 'assings publisher in @publisher' do
      assigns[:publisher].should eq(@publisher)
    end

    it 'render the ahow template' do
      response.should render_template('show')
    end
  end


  ########
  # EDIT
  ########

  describe '#EDIT' do

    before(:each) do
      @publisher = FactoryGirl.create(:publisher)
      get :edit, {id: @publisher }
    end

    it 'assing publisher in @publisher' do
      assigns[:publisher].should eq(@publisher)
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

      it 'saves the new publisher in database' do
        expect{ post :create, publisher: FactoryGirl.attributes_for(:publisher)}.to change(Publisher, :count).by(1)
      end

      it 'redirects to the show page' do
        @publisher = FactoryGirl.attributes_for(:publisher)
        post :create, { publisher: @publisher }
        response.should redirect_to Publisher.last
      end

    end

    context 'with invalid attributes' do

      it 'not saves the new publisher in database' do
        expect{ post :create, { publisher: FactoryGirl.build(:invalid_publisher) }}.to_not change(Publisher, :count)
      end

      it 're-render the new publisher template' do
        @publisher = FactoryGirl.build(:publisher)
        post :create, { publisher: @publisher }
        response.should render_template(:new)
      end

    end

  end


  ########
  # UPDATE
  ########
  describe '#UPDATE' do

    before(:each) do
      @publisher = FactoryGirl.create(:publisher)
    end

    context 'with valid attributes' do

      before(:each) do
        put :update, { id: @publisher, publisher: FactoryGirl.attributes_for(:publisher, name: 'Somebody') }
      end

      it 'locate the request publisher' do
        assigns[:publisher].should eq(@publisher)
      end

      it 'change @publisher attributes' do
        @publisher.reload
        @publisher.name.should eq('Somebody')
      end

      it 'redirect to the uploaded publisher' do
        response.should redirect_to(publisher_path(@publisher))
      end

    end

    context 'with invalid attributes' do

      before(:each) do
        put :update, { id: @publisher, publisher: FactoryGirl.attributes_for(:invalid_publisher) }
      end

      it 'locate the request publisher' do
        assigns[:publisher].should eq(@publisher)
      end

      it 'does not change @publisher attributes' do
        response.should_not eq(@publisher)
      end

      it 're-render edit publisher template' do
        response.should render_template(:edit)
      end

    end	

  end


  ########
  # DESTROY
  ########
  describe '#DESTROY' do

    before(:each) do
      @publisher = FactoryGirl.create(:publisher)
      delete :destroy, { id: @publisher }
    end

    it 'assign publisher in @publisher' do
      assigns[:publisher].should eq(@publisher)
    end

    it 'redirect to publisher list' do
      response.should redirect_to(publishers_path)
    end

  end

end
