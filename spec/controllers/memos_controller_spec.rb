require 'rails_helper'

RSpec.describe MemosController, type: :controller do
  before(:all) do
    @memo1 = FactoryBot.create(:memo1)
    @memo2 = FactoryBot.create(:memo2)
  end
  after(:all) do
    DatabaseCleaner.clean
  end
  describe "#index" do
    it "displays using index template" do
      get :index
      expect(response).to render_template :index
    end
  end
  describe "#update" do
    before do
      get 'edit', params:{ id: @memo1.id }
    end
    context( "when category_id is null, ") do
      it "data will not be updated, and return to edit." do
        patch :update, params: { id: @memo1, memo: attributes_for(:memo1_wrong) }
        expect(response).to render_template :edit
      end
    end
    context( "when category_id is not null, ") do
      it "will be updated." do
        patch :update, params: { id: @memo1, memo: attributes_for(:memo1_new) }
        @memo1.reload
        expect(@memo1.category_id).to eq(1)
        expect(@memo1.content).to eq("Meet with friend, at 19:00")
      end
      it "will be redirect, after updated." do
        patch :update, params: { id: @memo1, memo: attributes_for(:memo1_new) }
        expect(response).to redirect_to(memo_path(@memo1))
      end
    end
  end
end
