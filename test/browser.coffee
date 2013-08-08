  
describe 'KonamiCode', ->
  before ->
    element = document.createElement 'div'
    element.id = 'ok'
    element.innerHTML = 'OK'
    element.style.display = 'none'
    document.body.appendChild element

    @element = document.getElementById 'ok'

    add_script(
      'var b = new KonamiCode(
                function() {
                    document.getElementById("ok").style.display = "block";
                }
            );'
    )


  after ->
    document.body.removeChild @element

  it 'responds to standard konami code', ->
    expect(@element.style.display)
      .to.equal('none')
    keydown(38)
    keydown(38)
    keydown(40)
    keydown(40)
    keydown(37)
    keydown(39)
    keydown(37)
    keydown(39)
    keydown(66)
    keydown(65)
    expect(@element.style.display)
      .to.equal('block')
