class AnswersValidator < ActiveModel::Validator
  	def validate(record)
	    record.answers.each do |hash| 
	    	record.errors[:base] << "Answers empty!" if hash.values == nil 
	    end		      		    
	end
end