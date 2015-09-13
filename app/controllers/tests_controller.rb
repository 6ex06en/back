class TestsController < ApplicationController
before_action :signed_in_user, except: [:start]

def start
	@test = Test.new
end

def index
	@tests = Test.all
end

def update
	@test = Test.find_by_checksum(params[:test][:checksum])
	params[:test][:answers] = merge_params(params[:test], :answers)
	params[:test][:right_answer] = merge_params(params[:test], :right_answer)
	if @test.update_attributes(test_params)
		flash[:success] = "Вопрос обновлен"
		redirect_to tests_path
	else
		@test[:answers] = @test[:right_answer] = nil
		@object_with_errors = @test
		render "edit"
	end
end

def edit
	@test = Test.find_by_id(params[:id])
	@answers = @test.answers
	@right_answer = @test.right_answer
end

def destroy
	@test = Test.find_by_id(params[:id]).destroy
	flash[:success] = "Вопрос удален"
	redirect_to tests_path
end

def create
	params[:test][:answers] = merge_params(params[:test], :answers)
	params[:test][:right_answer] = merge_params(params[:test], :right_answer)
	# render text: params[:test]
	# render text: test_params
	@test = Test.new(test_params)
	if @test.save
		redirect_to root_path
		flash[:success] = "Вопрос теста создан"
	else
		@test[:answers] = @test[:right_answer] = nil
		@object_with_errors = @test
		render 'start'
	end
end

private

def test_params
	params.require(:test).permit(:question, :typeinput, :score, answers: ["A", "B", "C", "D", "E", "F"], 
		right_answer: [])
end

end
