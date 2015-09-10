class TestsController < ApplicationController

def start
	@test = Test.new
end

def index
	@tests = Test.all
end

def update
end

def destroy
	redirect_to tests_path
end

def create
	@params = ActionController::Parameters.new({
		test: {
			answers: merge_params(params[:test]),
			score: params[:test][:score],
			question: params[:test][:question],
			typeinput: params[:test][:typeinput]
			}
	})
	# render text: @params
	@test = Test.new(test_params)
	if @test.save
		redirect_to root_path
		flash[:success] = "Вопрос теста создан"
	else
		@object_with_errors = @test
		render 'start'
	end
end

private

def test_params
	@params.require(:test).permit(:question, :answers, :typeinput, :score)
end

end
