require "tanka_renderer/renderer/base"

module TankaRenderer
  module Renderer
    class PDF
      include Base

      def render(text, output_path)
        super
        Cairo::PDFSurface.new(output_path, @width, @height) do |surface|
          Cairo::Context.new(surface) do |context|
            draw(context, text)
            context.show_page
          end
        end
      end
    end
  end
end
