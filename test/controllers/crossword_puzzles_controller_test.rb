require "test_helper"

class CrosswordPuzzlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @crossword_puzzle = crossword_puzzles(:one)
  end

  test "should get index" do
    get crossword_puzzles_url, as: :json
    assert_response :success
  end

  test "should create crossword_puzzle" do
    assert_difference('CrosswordPuzzle.count') do
      post crossword_puzzles_url, params: { crossword_puzzle: { data: @crossword_puzzle.data, slug: @crossword_puzzle.slug, title: @crossword_puzzle.title } }, as: :json
    end

    assert_response 201
  end

  test "should show crossword_puzzle" do
    get crossword_puzzle_url(@crossword_puzzle), as: :json
    assert_response :success
  end

  test "should update crossword_puzzle" do
    patch crossword_puzzle_url(@crossword_puzzle), params: { crossword_puzzle: { data: @crossword_puzzle.data, slug: @crossword_puzzle.slug, title: @crossword_puzzle.title } }, as: :json
    assert_response 200
  end

  test "should destroy crossword_puzzle" do
    assert_difference('CrosswordPuzzle.count', -1) do
      delete crossword_puzzle_url(@crossword_puzzle), as: :json
    end

    assert_response 204
  end
end
