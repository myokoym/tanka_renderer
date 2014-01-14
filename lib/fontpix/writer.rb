require "cairo"
require "pango"
require "fontdock"

module Fontpix
  class Writer
    attr_accessor :width, :height, :font
    attr_accessor :body_color, :text_color
    def initialize
      @width = 300
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
      size = calc_font_size(text)
      layout.font_description = Pango::FontDescription.new("#{@font} #{size}")
      context.move_to(@width / 2 + size * text.each_line.to_a.length / 1.5, @height / 30)
      context.rotate(Math::PI / 2)
      context.show_pango_layout(layout)
    end

    def calc_font_size(text)
      max_length = 0
      text.each_line do |line|
        length = line.scan(/[ -~]/).length
        length += line.scan(/[^ -~]/).length * 2
        max_length = length if length > max_length
      end
      @height * 1.4 / max_length
    end
  end
end
