module TestsHelper
	def merge_params(params)
		if params[:typeinput] != "textInput"
			x = "b"		
			ar = []
			ar << {"A" => params[:answer_a].to_i}
			start = 1
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
	end

end
