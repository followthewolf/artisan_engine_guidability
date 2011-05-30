class DummyFrontController < FrontController
  def show_guide
    @guides = Guide.all
  end
end