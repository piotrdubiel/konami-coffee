should = require('chai').should()
KonamiCode = require('../lib/konami').KonamiCode

describe 'KonamiCode', ->
  describe 'initialize', ->
    it 'creates default sequence with no arguments', ->
      new KonamiCode()
        .sequence()
        .should
        .eql([38, 38, 40, 40, 37, 39, 37, 39, 66, 65])

    it 'creates keycode sequence from key names', ->
        new KonamiCode(null, 'uP, DOWN, Left, right, enter, a, A, 0')
          .sequence()
          .should
          .eql([38, 40, 37, 39, 13, 65, 65, 48])

