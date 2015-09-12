module TestsHelper

	def merge_params(params, option)
		ar = []
		start = 1
		if option == :answers 
				if params[:typeinput] != "textInput"
					x = "b"		
					ar << {"A" => (params[:answer_a].present?) ? params[:answer_a] : nil}
					while start < params.length
						sym = "answer_#{x}".to_sym
						ar << {x.upcase => params[sym]} if params[sym]
						x.next!
						start += 1
					end
					ar
				else
					ar = params[:answers].present? ? ar << {"A" => params[:answers]} : nil
				end
		elsif option == :right_answer
			x = "A"
			if params[:typeinput] != "textInput" and params[:typeinput].present?
				while start < params.length
						sym = "right_#{x}".to_sym
						ar << params[sym] if params[sym]
						x.next!
						start += 1
				end
				ar
			else
				right = params[:answers].present? ? ["A"] : nil
			end
		end			
	end

end
