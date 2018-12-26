require 'rails_helper'

RSpec.describe "memos/index", type: :view do
  feature "in the memos index screen," do
    scenario "When clicked New Memo, open the new memo screen" do
      visit memos_path # in Memos Index screen
      find("#newMemoBtn").click
      expect(page).to have_content 'New Memo'
    end
  end
end
