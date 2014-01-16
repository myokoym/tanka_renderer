# -*- coding: utf-8 -*-
require "tanka_renderer/renderer"
require "cairo"

class RendererTest < Test::Unit::TestCase
  class BaseTest < self
    def setup
      @renderer = TankaRenderer::Renderer::Image.new
    end

    class GuessFontTest < self
      def test_found
        part_of_name = "M"
        assert_match(/#{part_of_name}/, @renderer.guess_font(part_of_name))
      end

      def test_not_found
        part_of_name = "ABCDE12345"
        assert_nil(@renderer.guess_font(part_of_name))
      end
    end

    class DrawTest < self
      def test_ten_characters
        assert_nothing_raised_in_draw("1234567890")
      end

      private
      def assert_nothing_raised_in_draw(text)
        width =  200
        height = 200
        assert_nothing_raised do
          Cairo::ImageSurface.new(:argb32, width, height) do |surface|
            Cairo::Context.new(surface) do |context|
              @renderer.draw(context, text)
            end
          end
        end
      end
    end
  end

  class ImageTest < self
    def setup
      @renderer = TankaRenderer::Renderer::Image.new
      @tmp_dir = File.join(File.dirname(__FILE__), "tmp")
      FileUtils.mkdir_p(@tmp_dir)
    end

    def teardown
      FileUtils.rm(Dir.glob(File.join(@tmp_dir, "*")))
      FileUtils.rmdir(@tmp_dir)
    end

    def test_render
      output_path = File.join(@tmp_dir, "test.png")
      @renderer.render("南家", output_path)
    end
  end

  class PDFTest < self
    def setup
      @renderer = TankaRenderer::Renderer::PDF.new
      @tmp_dir = File.join(File.dirname(__FILE__), "tmp")
      FileUtils.mkdir_p(@tmp_dir)
    end

    def teardown
      FileUtils.rm(Dir.glob(File.join(@tmp_dir, "*")))
      FileUtils.rmdir(@tmp_dir)
    end

    def test_render
      output_path = File.join(@tmp_dir, "test.pdf")
      @renderer.render("神薙", output_path)
    end
  end
end
