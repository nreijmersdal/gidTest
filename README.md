gidTest
=======
gidTest is a simplistic test framework for [Gideros Mobile](http://www.giderosmobile.com/) applications

Goals
======
* jUnit style of tests
* Support [TDD](http://en.wikipedia.org/wiki/Test-driven_development) within [Gideros Studio](http://www.giderosmobile.com/gideros-studio-features/)
* Give fast visual feedback

How to use
=======
* Clone the project
* Open the gidTest.proj file in Gideros Studio
* Start the Gideros Player
* Run the Project

This shows something like this in the output window:

    gidTest tests: 3
    ------------------------------
    test_type: Succeeded
    test_true: Succeeded
    test_false:
    * This test fails (assertEquals: actual:true, expected:false)
    * Failed
    ------------------------------
    Result: Failed (2/3)

Also a transparant square will be drawn in the application, showing the state of the testsuite, either red of green.

Work in progress
=======
Committed an initial version, now I am going to work with it and see what it grows into.  
Be warned: In its current state gidTest is a very amateuristic framework, I am not a professional developer. :)

Continuous Integration
=======
You can use the 'gdrbridge.exe' tool from Gideros to start the project against a player (which you can also start from the command line)  
This means that it should be possible to run your tests from a CI server like [Jenkins](http://jenkins-ci.org/)

License
=======
Copyright (c) 2012 Niels van Reijmersdal

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.