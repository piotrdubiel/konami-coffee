// Generated by CoffeeScript 1.3.3
(function() {
  var KonamiCode, should;

  should = require('chai').should();

  KonamiCode = require('../lib/konami').KonamiCode;

  describe('KonamiCode', function() {
    return describe('initialize', function() {
      it('creates default sequence with no arguments', function() {
        return new KonamiCode().sequence().should.eql([38, 38, 40, 40, 37, 39, 37, 39, 66, 65]);
      });
      return it('creates keycode sequence from key names', function() {
        return new KonamiCode(null, 'uP, DOWN, Left, right, enter, a, A, 0').sequence().should.eql([38, 40, 37, 39, 13, 65, 65, 48]);
      });
    });
  });

}).call(this);