class QuotesController < ApplicationController
  before_action :set_quote, only: [ :show, :edit, :update, :destroy ]

  helper_method :get_quote
  def get_quote
    @quote
  end

  def index
    # debugger
    # @quotes = Quote.all
    # @quotes = Quote.ordered
    # The QuotesController#index method should only show the quotes that belong to the current user's company
    @quotes = current_company.quotes.ordered
  end

  def show
    @instance_variables = instance_variables
  end

  def new
    @quote = Quote.new
  end

  def create
    # Only this first line changes to make sure the association is created
    @quote = current_company.quotes.build(quote_params)

    if @quote.save
      respond_to do |format|
        format.html { redirect_to quotes_path, notice: "HTML: Quote was successfully created." }
        format.turbo_stream { flash.now[:notice] = "STREAM: Quote was successfully created." }
        # respond_to do |format|
        #   format.html {
        #     flash[:notice] = "Quote was successfully created."
        #     redirect_to quotes_path
        #   }
        # format.turbo_stream {
        #   flash[:notice] = "Quote was successfully created."
        # }
      end
    else
      flash[:error] = "Quote could not be created! Check Errors!"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    # if @quote.update(quote_params)
    #   redirect_to quotes_path, notice: "Quote was successfully updated."
    if @quote.update(quote_params)
      respond_to do |format|
        format.html { redirect_to quotes_path, notice: "Quote was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "Quote was successfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @quote.destroy

    respond_to do |format|
      # redirect_to quotes_path, notice: "Quote was successfully destroyed."
      format.html { redirect_to quotes_path, notice: "Quote was successfully destroyed." }
      format.turbo_stream { flash.now[:notice] = "Quote was successfully destroyed." }
    end
  end

  private

  def set_quote
    # We must use current_company.quotes here instead of Quote
    # for security reasons
    @quote = current_company.quotes.find(params[:id])
  end

  def quote_params
    params.require(:quote).permit(:name)
  end
end
