class Quote < ApplicationRecord
  has_many :line_item_dates, dependent: :destroy

  belongs_to :company

  validates :name, presence: true

  scope :ordered, -> { order(created_at: :asc) }

  # after_create_commit -> { broadcast_prepend_to "quotes", partial: "quotes/quote", locals: { quote: self }, target: "quotes" }

  # after_create_commit -> { broadcast_prepend_to "quotes", partial: "quotes/quote", locals: { quote: self } }

  #   There are two other conventions we can use to shorten our code. Under the hood, Turbo has a default value for both the partial and the locals option.
  # The partial default value is equal to calling to_partial_path on an instance of the model, which by default in Rails for our Quote model is equal to "quotes/quote".
  # The locals default value is equal to { model_name.element.to_sym => self } which, in in the context of our Quote model, is equal to { quote: self }.
  # These are precisely the values that we passed as options. Thus, the following code is equivalent to what we had before:

  #########################################################
  # Instruct our app when a new quote is created
  # after_create_commit -> { broadcast_prepend_to "quotes" }
  # Instruct our app when a quote is updated
  # after_update_commit -> { broadcast_replace_to "quotes" }
  # Instruct our app when a quote is destroyed (deleted)
  # after_destroy_commit -> { broadcast_remove_to "quotes" }
  #########################################################
  # An Asynchronnous Alternative
  # after_create_commit -> { broadcast_prepend_later_to "quotes" }
  # after_update_commit -> { broadcast_replace_later_to "quotes" }
  # after_destroy_commit -> { broadcast_remove_to "quotes" }

  # Sentactic Suger WOW!!!
  # broadcasts_to ->(quote) { "quotes" }, inserts_by: :prepend
  # We want to have the same signed-stream-name for the accountant and the manager and a different one for the eavesdropper. To do this, we have to change the stream name where the quotes' HTML will be broadcasted.
  broadcasts_to ->(quote) { [ quote.company, "quotes" ] }, inserts_by: :prepend, partial: "quotes/quote_without_devise"
  # TODO: what does like 35 do?
  # def special_name
  #     "special_#{name}"
  # end
end
