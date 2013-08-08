konami-coffee
=============

Simple lib for detecting konami code sequence on the website

Example
-------

Add lib/konami.js file to your html file and include this little script:
    
    <script>
        var b = new KonamiCode(
           function() {
               alert('Triggered');
           }
        );
    </script>


You can customize detected code by passing comma-separated list of keys to KonamiCode object:

    <script>
        var b = new KonamiCode(
           function() {
               alert('Triggered');
           },
           'up, left, down, a, z, x, 0, 9'
        );
    </script>

Currently only arrows (up, down, left, right) and alphanumeric symbols are supported.
