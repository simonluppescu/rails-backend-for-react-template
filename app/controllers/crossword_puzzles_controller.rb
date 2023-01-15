class CrosswordPuzzlesController < ApplicationController
  before_action :set_crossword_puzzle, only: [:show, :update, :destroy]

  # GET /crossword_puzzles
  def index
    @crossword_puzzles = CrosswordPuzzle.all

    render json: @crossword_puzzles
  end

  # GET /crossword_puzzles/1
  def show
    render json: @crossword_puzzle
  end

  # POST /crossword_puzzles
  def create
    @crossword_puzzle = CrosswordPuzzle.new(crossword_puzzle_params)

    if @crossword_puzzle.save
      render json: @crossword_puzzle, status: :created, location: @crossword_puzzle
    else
      render json: @crossword_puzzle.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /crossword_puzzles/1
  def update
    if @crossword_puzzle.update(crossword_puzzle_params)
      render json: @crossword_puzzle
    else
      render json: @crossword_puzzle.errors, status: :unprocessable_entity
    end
  end

  # DELETE /crossword_puzzles/1
  def destroy
    @crossword_puzzle.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crossword_puzzle
      @crossword_puzzle = CrosswordPuzzle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def crossword_puzzle_params
      params.require(:crossword_puzzle).permit(:title, :slug, :data)
    end
end
