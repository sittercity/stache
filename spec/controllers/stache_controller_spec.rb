require 'spec_helper'
require 'dummy/app/views/stache/with_layout'

describe StacheController do
  render_views

  it "can get to index and render a Mustache" do
    get :index
    assert_response 200

    response.should render_template 'index'               # view
    response.body.should =~ /Hello, Matt!/
  end

  it 'correctly renders partials with a layout class' do
    get :with_layout
    assert_response 200

    response.body.should == "#wrapper\nfoobar\nthis is a test partial\n\n#end_wrapper\n"
  end
end
