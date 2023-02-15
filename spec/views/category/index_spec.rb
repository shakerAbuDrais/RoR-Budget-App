RSpec.describe "categories/index", type: :view do
  let(:user) { create(:user) }

  before do
    assign(:categories, [])
    allow(view).to receive(:current_user).and_return(user)
  end

  it "renders the categories view" do
    render
    expect(rendered).to have_selector("h1", text: "Categories")
  end
end
