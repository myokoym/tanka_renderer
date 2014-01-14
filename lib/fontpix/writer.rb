require "cairo"
require "pango"
require "fontdock"

module Fontpix
  class Writer
    attr_accessor :width, :height, :font
    attr_accessor :body_color, :text_color
    def initialize
      @width = 100
      @height = 500
      @font = "IPAMincho"
      @body_color = :white
      @text_color = :black
    end

    def guess_font(part_of_font_name)
      @font = Fontdock::Local.find(part_of_font_name)
    end

    def write_to_png(text, output_path)
      Cairo::ImageSurface.new(:argb32, @width, @height) do |surface|
        Cairo::Context.new(surface) do |context|
          draw(context, text)
        end
        surface.write_to_png(output_path)
      end
    end

    def draw(context, text)
      draw_body(context)
      draw_text(context, text)
    end

    private
    def draw_body(context)
      context.set_source_color(@body_color)
      context.paint
    end

    def draw_text(context, text)
      context.set_source_color(@text_color)
      layout = context.create_pango_layout
      layout.context.base_gravity = :east
      layout.text = text
      size = @height * 0.7 / text.length
      layout.font_description = Pango::FontDescription.new("#{@font} #{size}")
      context.move_to(@width / 2 + size / 1.5, @height / 30)
      context.rotate(Math::PI / 2)
      context.show_pango_layout(layout)
    end
  end
end
