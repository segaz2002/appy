defmodule AppyWeb.Components.DefaultLayout do
  use Surface.Component

  alias AppyWeb.Components.{NavBar, Footer}

  @doc "The content of the Hero"
  slot(content, required: true)
  slot(default)

  def render(assigns) do
    ~F"""
      <NavBar />
      <div class="container">
        <div class="notification is-info">
          This container is <strong>centered</strong> on desktop and larger viewports.
        </div>
        <#slot name="default" />
        <#slot name="content" />
      </div>
      <Footer />
    """
  end
end
