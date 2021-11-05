defmodule AppyWeb.Components.AdminLayout do
  use Surface.Component

  alias AppyWeb.Components.{NavBar, Footer}

  @doc "The content of the Hero"
  slot(content, required: true)

  def render(assigns) do
    ~F"""
      <NavBar />
      <div class="columns">
        <div class="column is-2">
            <p class="menu-label is-hidden-touch">Navigation</p>
            <ul class="menu-list">
              <li>
                <a href="#" class="">
                  <span class="icon"><i class="fas fa-home"></i></span> Home
                </a>
              </li>
              <li>
                <a href="#" class="is-active">
                  <span class="icon"><i class="fas fa-table"></i></span> Links
                </a>

                <ul>
                  <li>
                    <a href="#">
                      <span class="icon is-small"><i class="fa fa-link"></i></span> Link1
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <span class="icon is-small"><i class="fa fa-link"></i></span> Link2
                    </a>
                  </li>
                </ul>
              </li>
              <li>
                <a href="#" class="">
                  <span class="icon"><i class="fa fa-info"></i></span> About
                </a>
              </li>
            </ul>
        </div>
        <div class="column is-10">
          <#slot name="content" />
        </div>
      </div>
      <Footer />
    """
  end
end
