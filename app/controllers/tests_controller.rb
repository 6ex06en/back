class TestsController < ApplicationController

def start
	@test = Test.new
end

def index
end

def update
end

def destroy
end

def create
	params[:test][:answers] = params[:test][:answers].split(",") if params[:test][:answers]
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
	params.require(:test).permit(:question, :answers, :typeinput, :score)
end

end
