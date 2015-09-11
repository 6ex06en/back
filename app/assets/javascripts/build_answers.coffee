window.build_answers = (build, answers, right_answer) ->
  start_answer = "B"
  delete_answer = []
  getChar = ->
    if delete_answer.length > 0
     ch = delete_answer[0] 
    else
     ch = start_answer
    ch
  rebuild = (answers, right_answer) ->
    $(".multiple_answers").removeClass("hidden") if answers.length > 1
    $(".one_answer").removeClass("hidden") if answers.length == 1
    start_char = ''
    for obj in answers
      for key of obj
        $(".one_answer").children().last().addClass("has-success") if key == "A" and right_answer[0] == "A" and answers.length == 1
        $(".multiple_answers .input-group").addClass("has-success") if key == "A" and right_answer[0] == "A" and answers.length > 1
        if answers.length == 1 and key == "A"
          $(".one_answer").find("input[type='text']").val(obj[key])
          $(".one_answer").children().last().append("<input type='hidden' name='test[right_" + "A" + "]'value='"+"A"+"'></input>") 
        if answers.length > 1 and key == "A"
          $(".multiple_answers #answer_a").val(obj[key])
          $(".multiple_answers .input-group").append("<input type='hidden' name='test[right_" + "A" + "]'value='"+"A"+"'></input>")        
        continue if key == "A"
        $(".multiple_answers").last().after($("<div/>", {class: "form-group multiple_answers"}))
        container = $(".multiple_answers").last()
        label = '<label for="answer-'+ key.toLowerCase()+ '"' + "class='control-label col-sm-2 col-md-2 col-lg-2'>" + key + '<label/>'
        container.append(label)
        container.append('<div class="col-sm-5 col-md-5 col-lg-5 input-group"></div>')
        inner_container = container.children().last()
        inner_container.append($("<input/>", {placeholder: "Варианты ответа", required: true, type:'text', id:"answer_#{key.toLowerCase()}", name: "test[answer_#{key.toLowerCase()}]", class: "form-control", value: obj[key]}))
        inner_container.append("<span class='input-group-addon glyphicon glyphicon-ok'></span>")
        container.append($('<span/>', {class:"add_question_container glyphicon glyphicon-circle-arrow-down"}))
        container.append($('<span/>', {class:"delete-x glyphicon glyphicon-remove", question: key.toLowerCase()}))
        delete_span = container.find(".delete-x")
        add_span = container.find(".add_question_container")
        right_answer.forEach( (item, index) ->
          if right_answer[index] == key
            inner_container.addClass("has-success")
            name = container.find("label").first().text()
            inner_container.append("<input type='hidden' name='test[right_" + name + "]'value='"+name+"'></input>")
        )
        start_char = String.fromCharCode(key.charCodeAt(0) + 1)

    $(".multiple_answers .glyphicon-ok").click( ->
      $(this).parent().toggleClass("has-success")
      name = $(this).prev().attr('name').slice(-2, -1).toUpperCase()
      if $(this).parent().hasClass("has-success")
        $(this).parent().append("<input type='hidden' name='test[right_" + name + "]'value='"+name+"'></input>")
      else
        $(this).parent().find("input[type='hidden']").remove()
    )

    $(".delete-x").click( ->
      delete_answer.push($(this).attr("question").toUpperCase())
      container.remove()
      $(".add_question_container:last").removeClass("hidden")
    )

    $(".add_question_container").click( ->
      $(".multiple_answers:not(:first) .glyphicon-ok").off("click")      
      create_container(start_char)
    )
        
    $(".add_question_container").addClass('hidden')
    $(".add_question_container:last").removeClass("hidden")
    $(".multiple_answers").removeClass("hidden") if answers.length > 1
    $(".one_answer").removeClass("hidden") if answers.length == 1
    $(document).ready( ->
      $("#type_input").change( ->
        $(".multiple_answers, .one_answer").addClass("hidden").removeClass("visible")
        $(".multiple_answers").toggleClass("hidden visible") if $("#type_input option:selected").text() == "checkboxInput" || $("#type_input option:selected").text() == "radioButton"
        $(".one_answer").toggleClass("hidden visible ") if $("#type_input option:selected").text() == "textInput"
      )
    )
    return

  rebuild(answers, right_answer) if build == true
    
  create_container = (start_char)->
    start_answer = start_char if start_char != undefined
    delete_answer.sort()
    $(".add_question_container").addClass('hidden')
    $(".multiple_answers").last().after($("<div/>", {class: "form-group multiple_answers"}))
    container = $(".multiple_answers").last()
    label = '<label for="answer-'+ getChar()+ '"' + "class='control-label col-sm-2 col-md-2 col-lg-2'>" + getChar() + '<label/>'
    container.append(label)
    container.append('<div class="col-sm-5 col-md-5 col-lg-5 input-group"></div>')
    inner_container = container.children().last()
    inner_container.append($("<input/>", {placeholder: "Напишите ответ", required: true, type:'text', id:"answer_#{getChar()}", name: "test[answer_#{getChar().toLowerCase()}]", class: "form-control"}))
    inner_container.append("<span class='input-group-addon glyphicon glyphicon-ok'></span>")
    container.append($('<span/>', {class:"add_question_container glyphicon glyphicon-circle-arrow-down"}))
    container.append($('<span/>', {class:"delete-x glyphicon glyphicon-remove", question: getChar()}))
    delete_span = container.find(".delete-x")
    add_span = container.find(".add_question_container")
    start_answer =  String.fromCharCode(start_answer.charCodeAt(0) + 1) if delete_answer.length == 0 
    delete_answer.shift() if delete_answer.length > 0 

    $(".multiple_answers:not(:first) .glyphicon-ok").click( ->
      $(this).parent().toggleClass("has-success")
      name = $(this).prev().attr('name').slice(-2, -1).toUpperCase()
      if $(this).parent().hasClass("has-success")
        $(this).parent().append("<input type='hidden' name='test[right_" + name + "]'value='"+name+"'></input>")
      else
        $(this).parent().find("input[type='hidden']").remove()
    )

    $(delete_span).click( ->
      delete_answer.push($(this).attr("question"))
      container.remove()
      # start_answer =  String.fromCharCode(start_answer.charCodeAt(0) - 1)
      $(".add_question_container:last").removeClass("hidden")

    )
    $(add_span).click( ->
       # start_answer =  String.fromCharCode(start_answer.charCodeAt(0) + 1)
      $(".multiple_answers:not(:first) .glyphicon-ok").off("click")      
      create_container()
    )
window.answers = build_answers()
