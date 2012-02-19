var request = require('request'),
	jsdom = require('jsdom');

request({uri: 'http://www.okcupid.com/login'}, function (error, response, body) {
  if (!error && response.statusCode == 200) {
    // console.log(body) // Print the google web page.
  }

  jsdom.env({
  	html: body,
  	scripts: [
  		'http://code.jquery.com/jquery-1.5.min.js'
  	]
  }, function (err, window)	{
  	var $ = window.jQuery;
  	
  	// console.log($("body").html());

    // var form   = $('#htlbotForm');
    // var data   = form.serialize();
    // var url    = form.attr('action') || 'get';
    // var type   = form.attr('enctype') || 'application/x-www-form-urlencoded';
    // var method = form.attr('method');

    request({
      url    : "http://www.okcupid.com/login",
      method : "post",
      body   : "p=&dest=&username=piesrtasty&password=shutup%211",
      headers : {
        'Content-type' : 'application/x-www-form-urlencoded'
      }
    },function(error, response, body) {
      // console.log("----");
      // console.log();
      // this assumes no error for brevity.
      var newDoc = jsdom.env(body, ['http://code.jquery.com/jquery-1.5.min.js'], function(errors, window) {
      // do your post processing
        var $ = window.jQuery;

        console.log($("#home_heading").html());


      });
    });


  });
});