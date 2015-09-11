module TestsHelper

	def merge_params(params, option)
		ar = []
		start = 1
		if option == :answers
			if params[:typeinput] != "textInput"
				x = "b"		
				ar << {"A" => params[:answer_a].to_i}
				while start < params.length
					sym = "answer_#{x}".to_sym
					ar << {x.upcase => params[sym].to_i} if params[sym]
					x.next!
					start += 1
				end
				ar
			else
				params[:answers].split()
			end
		elsif option == :right_answer
			x = "A"
			while start < params.length
					sym = "right_#{x}".to_sym
					ar << params[sym] if params[sym]
					x.next!
					start += 1
				end
			ar
		end			
	end

end
