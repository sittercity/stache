require 'stache/view'

module Stache
  # This class is for providing layouts in a better way.
  # Your page class should extend this class.
  class Layout < ::Stache::View
    # template here would be the pages' template, not the layout.
    def render(data = template, ctx = {})
      # Store the current template, we'll need to stuff it inside the layout
      page_template = data

      # Grab the layout template, to render it at the end
      layout = partial(:layout)

      # Render the page_template using this class's context
      # (which will be combined with the layout context)
      rendered_template = super(page_template, ctx)

      # stick that rendered template as :yield into the layout template
      # (which will be combined with the current context)
      super(layout, :yield => rendered_template)
    end
  end
end
