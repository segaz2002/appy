defmodule AppyWeb.Components.QuestionCard do
  # stateful component
  use Surface.LiveComponent
  alias Appy.Model.Question

  # data macro will do the same thing we could have done on mount,
  # where we add additional values into the current assigns
  data(question, :string)
  data(answered, :boolean, default: false)
  data(question_card, :any)

  def mount(socket) do
    question_card = random_question_card()

    {:ok, assign(socket, question: question_card.description, question_card: question_card)}
  end

  def render(assigns) do
    ~F"""
    <div class="card">
    <header class="card-header">
    <p class="card-header-title">
      Question 1
    </p>
    <button class="card-header-icon" aria-label="more options">
      <span class="icon">
        <i class="fas fa-angle-down" aria-hidden="true"></i>
      </span>
    </button>
    </header>
    <div class="card-content">
    <div class="content">
      <h1>{@question}</h1>
    </div>
    </div>
    <footer class="card-footer">
    <a :on-click="answer" href="#" class="card-footer-item">Show answer</a>
    <a :if={@answered}  :on-click="next" href="#" class="card-footer-item">Next Question</a>
    <a href="#" class="card-footer-item">Skip</a>
    </footer>
    </div>
    """
  end

  def handle_event("answer", _value, socket) do
    question_card = socket.assigns.question_card

    {:noreply, assign(socket, question: question_card.answer, answered: true)}
  end

  def handle_event("next", _value, socket) do
    question_card = random_question_card()

    {:noreply,
     assign(socket,
       question: question_card.description,
       question_card: question_card,
       answered: false
     )}
  end

  defp random_question_card() do
    # Appy.Repo.all(Question)
    [
      %Question{description: "What is your favorite food", answer: "Amala"},
      %Question{description: "What year was Covid19 reported", answer: "2019"}
    ]
    |> Enum.random()
  end
end
