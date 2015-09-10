window.build_answers =  ->
  start_answer = "B"
  delete_answer = []
  getChar = ->
    if delete_answer.length > 0
     ch = delete_answer[0] 
    else
     ch = start_answer
    ch
  create_container = ->
    delete_answer.sort()
    $(".add_question_container").addClass('hidden')
    $(".multiple_answers").last().after($("<div/>", {class: "form-group multiple_answers"}))
    container = $(".multiple_answers").last()
    label = '<label for="answer-'+ getChar()+ '"' + "class='control-label col-sm-2 col-md-2 col-lg-2'>" + getChar() + '<label/>'
    container.append(label)
    container.append('<div class="col-sm-5 col-md-5 col-lg-5"></div>')
    inner_container = container.children().last()
    inner_container.append($("<input/>", {placeholder: "Напишите ответ", type:'text', id:"answer_#{getChar()}", name: "test[answer_#{getChar().toLowerCase()}]", class: "form-control"}))
    container.append($('<span/>', {class:"add_question_container glyphicon glyphicon-circle-arrow-down"}))
    container.append($('<span/>', {class:"delete-x glyphicon glyphicon-remove", question: getChar()}))
    delete_span = container.find(".delete-x")
    add_span = container.find(".add_question_container")
    start_answer =  String.fromCharCode(start_answer.charCodeAt(0) + 1) if delete_answer.length == 0 
    delete_answer.shift() if delete_answer.length > 0    
    $(delete_span).click( ->
      delete_answer.push($(this).attr("question"))
      container.remove()
      # start_answer =  String.fromCharCode(start_answer.charCodeAt(0) - 1)
      $(".add_question_container:last").removeClass("hidden"))
    $(add_span).click( ->
       # start_answer =  String.fromCharCode(start_answer.charCodeAt(0) + 1)      
      create_container())
    return
window.answers = build_answers()
