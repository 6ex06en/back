class Test < ActiveRecord::Base
	serialize :answers, Array
	serialize :right_answer, Array
	validates :question, presence:true, length: {maximum: 800, minimum: 3}, uniqueness: { case_sensitive: false }
	validates :typeinput, presence:true, inclusion: {in: %w(textInput checkboxInput radioButton)}
	validates :score, presence:true, length: {minimum: 1}, numericality: { greater_than: 0 }
	validates :answers, presence:true
	validates :answers, presence:true, length: {minimum: 2}, :if => Proc.new{|x| x.typeinput != 'textInput'}
	validates_with AnswersValidator
	validates :right_answer, presence:true, length: {maximum: 1, message: "should be one"}, :if => Proc.new{|x| x.typeinput != "checkboxInput"}
	validates :right_answer, presence:true, length: {minimum: 1}, :if => Proc.new{|x| x.typeinput == "checkboxInput"}
	before_create :create_checksum

	private

	def create_checksum
		rand = rand(1000000..2000000)
		loop do 
			if Test.find_by_checksum(rand)
				rand = rand(1000000..2000000)
			else
				break
			end
		end
		self.checksum = rand 
	end
 
	def self.check_answers(answers)
		result = {}
		answers.each do |answer|
			if question = Test.find_by_checksum(answer[:checksum])
				result[answer[:checksum]] = {right: question.right_answer, your: answer[:answers], question: answer[:question]}
				result[answer[:checksum]][:score] = question.score if answer[:answers].sort == question.right_answer.sort
			end
		end
		result
	end 

end
