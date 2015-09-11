class AnswersValidator < ActiveModel::Validator
  	def validate(record)
	    record.answers[0].each do |key, value| 
	    	record.errors[:base] << "Answers empty!" if value == nil 
	    end		      		    
	end
end