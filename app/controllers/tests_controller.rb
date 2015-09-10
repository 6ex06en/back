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
	params[:test][:answers] = merge_params(params[:test])
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
	params.require(:test).permit(:question, :typeinput, :score, answers: ["A", "B", "C", "D", "E", "F"])
end

end
