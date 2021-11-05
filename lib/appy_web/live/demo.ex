defmodule AppyWeb.Demo do
  use Surface.LiveView

  alias AppyWeb.Components.{DefaultLayout, QuestionCard}

  # Note every stateful component must have an ID
  def render(assigns) do
    ~F"""
    <DefaultLayout>
      <h1 class="title is-1">Hello</h1>

      <:content>
        <QuestionCard id="question-card" />
      </:content>
    </DefaultLayout>
    """
  end
end
