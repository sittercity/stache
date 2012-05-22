RSpec.configure do |config|

  # Specs tagged type: :stache set the Stache view context
  config.around do |example|
    if :view == example.metadata[:type]
      ApplicationController.new.set_current_view_context
      Stache::ViewContext.current.controller.request ||= ActionController::TestRequest.new
      Stache::ViewContext.current.request            ||= Stache::ViewContext.current.controller.request
      Stache::ViewContext.current.params             ||= {}
    end
    example.call
  end
end
