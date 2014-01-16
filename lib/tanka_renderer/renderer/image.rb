require "tanka_renderer/renderer/base"

module TankaRenderer
  module Renderer
    class Image
      include Base

      def render(text, output_path)
        super
        Cairo::ImageSurface.new(:argb32, @width, @height) do |surface|
          Cairo::Context.new(surface) do |context|
            draw(context, text)
          end
          surface.write_to_png(output_path)
        end
      end
    end
  end
end
