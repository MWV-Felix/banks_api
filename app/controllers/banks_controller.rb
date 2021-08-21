class BanksController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_bank, only: %i[ show update destroy ]

  # GET /banks
  # GET /banks.json
  def index
    @banks = Bank.all
    render json: @banks
  end

  def test_pagination
    @banks = Bank.paginate(:page => params[:page], :per_page => 1)

    render json: @banks
  end

  # GET /banks/1
  # GET /banks/1.json
  def show
    render json: @bank
  end

  # POST /banks
  # POST /banks.json
  def create
    @bank = Bank.new(bank_params)

    if @bank.save
      render :show, status: :created, location: @bank
    else
      render json: @bank.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /banks/1
  # PATCH/PUT /banks/1.json
  def update
    if @bank.update(bank_params)
      render :show, status: :ok, location: @bank
    else
      render json: @bank.errors, status: :unprocessable_entity
    end
  end

  # DELETE /banks/1
  # DELETE /banks/1.json
  def destroy
    @bank.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bank
      @bank = Bank.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bank_params
      params.require(:bank).permit(:name, :alias)
    end
end
