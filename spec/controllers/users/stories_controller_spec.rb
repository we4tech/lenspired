describe Users::StoriesController, type: :controller do
  let(:user) { FactoryGirl.create :user }
  before { sign_in user }

  describe '#new' do
    before { get :new }

    it 'assigns story' do
      expect(assigns(:story)).to be_present
    end

    it 'renders new template' do
      expect(response).to render_template :new
    end
  end

  describe '#create' do
    context 'with required params' do
      subject do
        post :create, story: {
                        title:       'Hello world',
                        description: 'Hello world description',
                        image:       fixture_file_upload('img1.png'),
                        tag_list:    'dhaka, old town'
                    }
      end

      it 'creates story' do
        expect { subject }.to change { Story.count }
      end

      it 'attached image' do
        subject
        expect(assigns(:story).image).to be_present
      end

      it 'assigns tags' do
        subject
        expect(assigns(:story).reload.tag_list).to be == ['dhaka', 'old town']
      end

      it 'redirects to my stories' do
        subject
        expect(response).to redirect_to users_stories_path
      end
    end

    context 'without required params' do
      before do
        post :create, story: {titlex: 'hell'}
      end

      it 'renders new template' do
        expect(response).to render_template :new
      end

      it 'assigns story' do
        expect(assigns(:story)).to be_present
      end

      it 'has validation errors' do
        expect(assigns(:story).errors).to be_present
      end
    end
  end
end
