require "rails_helper"

RSpec.describe NewsarticlesController, type: :controller do
    # this name here should be the same as the one displayed in the top of newsarticles_controller.rb
    describe "#new" do
        it "renders the new template" do
            
            get(:new)

            expect(response).to (render_template :new)
        end
        it "sets and instance variable with a new news article" do 
            get(:new)

            expect(assigns(:newsarticle)).to be_a_new(Newsarticle)#tests if their is a new Newsarticle
        end
    end
    describe "#create" do 
    # 'context' is funcationally the same as 'describe', but
    # we use context to group branching code paths. 
    context "with valid parameters" do 
        def valid_request 
            # The post method below simulates an HTTP request to the 
            # create action of JobPostsController using the POST verb 
            # This has the effect of a user filling out our new form 
            # in a browser and submitting
            post(:create, params: { newsarticle: FactoryBot.attributes_for(:newsarticle) })
        end

        it "creates a news article in the db" do 
            count_before = Newsarticle.count
            valid_request
            count_after = Newsarticle.count 
            expect(count_after).to(eq(count_before + 1))
        end

        it "redirects us to the show page for that news article" do 
            valid_request 
            expect(response).to(redirect_to(newsarticle_path(Newsarticle.last)))
        end
        it "sets a flash message" do
            valid_request
            expect(flash[:notice]).to be
        end
    end

    context "with invalid parameters" do 
        def invalid_request 
            post(:create, params: { newsarticle: FactoryBot.attributes_for(:newsarticle, title: nil) })
        end

        it "doesn't save a newsarticle in the db" do
            count_before = Newsarticle.count 
            invalid_request 
            count_after = Newsarticle.count 
            expect(count_after).to eq(count_before)
        end

        it "renders the new template" do 
            invalid_request
            expect(response).to render_template(:new)
        end
    end
   end

   describe '#destroy' do
   before do
     @newsarticle = FactoryBot.create(:newsarticle)
   end
   it 'removes a record from the database' do
     count_before = Newsarticle.count
     delete :destroy, params: {id: @newsarticle.id}
     count_after = Newsarticle.count
     expect(count_after).to eq(count_before - 1)
   end
   it 'redirects to the index' do
     delete :destroy, params: {id: @newsarticle.id}
     expect(response).to redirect_to newsarticles_path
   end
   it 'sets a flash message' do
     delete :destroy, params: {id: @newsarticle.id}
     expect(flash[:alert]).to be
   end
 end
 describe '#show' do
   it "renders the show template" do
     newsarticle = FactoryBot.create(:newsarticle)
     get :show, params: { id: newsarticle.id }
     expect(response).to render_template(:show)
   end
   it "sets an instance variable based on the article id that is passed" do
     newsarticle = FactoryBot.create(:newsarticle)
     get :show, params: { id: newsarticle.id }
     expect(assigns(:newsarticle)).to eq(newsarticle)
   end
 end
 describe '#index' do
   before do
     get :index
   end
   it "renders the index template" do
     expect(response).to render_template(:index)
   end
   it "assigns an instance variable to all created news articles (sorted by created_at)" do
     newsarticle_1 = FactoryBot.create(:newsarticle)
     newsarticle_2 = FactoryBot.create(:newsarticle)
     expect(assigns(:newsarticles)).to eq([newsarticle_2, newsarticle_1])
   end
 end
describe "#edit" do
    it "renders the edit template" do
      newsarticle = FactoryBot.create(:newsarticle)
      get :edit, params: { id: newsarticle.id }
      expect(response).to render_template :edit
    end
    it "sets an instance variable based on the article id that is passed" do
      newsarticle = FactoryBot.create(:newsarticle)
      get :edit, params: { id: newsarticle.id }
      expect(assigns(:newsarticle)).to eq(newsarticle)
    end
  end
  describe "#update" do
    before do
      @newsarticle = FactoryBot.create(:newsarticle)
    end
    context 'with valid parameters' do
      it "updates the news article record with new attributes" do
        new_title = "#{@newsarticle.title} Plus Changes!"
        patch :update, params: {id: @newsarticle.id, newsarticle: {title: new_title}}
        expect(@newsarticle.reload.title).to eq(new_title) 
      end
      it "redirect to the news article show page" do
        new_title = "#{@newsarticle.title} plus changes!"
        patch :update, params: {id: @newsarticle.id, newsarticle: {title: new_title}}
        expect(response).to redirect_to(@newsarticle)
      end
    end
    context 'with invalid parameters' do
      def invalid_request
        patch :update, params: {id: @newsarticle.id, newsarticle: {title: nil}}
      end
      it "doesn't update the news article with new attributes" do
        expect { invalid_request }.not_to change { @newsarticle.reload.title }
      end
      it "renders the edit template" do
        invalid_request
        expect(response).to render_template(:edit)
      end
    end
  end
end



    # newsarticle = FactoryBot.create(:job_post)
    #     get(:edit, params: { id: job_post.id })
    #     expect(assigns(:job_post)).to eq(job_post)

    #     newsarticle = FactoryBot.create(:newsarticle)
    #     get(:edit, params: {id: newsarticle.id })
    #     expect(response).to render_template(:show)

    #     expect(response).to render_template(:index)
        
    #     newsarticle = FactoryBot.create(:newsarticle)
    #  get :show, params: { id: newsarticle.id }
    #  expect(assigns(:newsarticle)).to eq(newsarticle)

    #  expect(flash[:alert]).to be
    #  expect(response).to(redirect_to(newsarticle_path(Newsarticle.last)))

    #  expect(count_after).to(eq(count_before + 1))