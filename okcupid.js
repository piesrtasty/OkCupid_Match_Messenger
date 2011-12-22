var zombie = require("zombie");
b = new zombie.Browser({ debug: true })

b.visit("http://wwww.okcupid.com", function(err, browser) {
	// if (browser.fill("sidebar_signin_username", "okcupidmatchmessenger"))	{
	// 	console.log("yes");
	// }
	if (err)	{
		console.log('Error:' + err.message)
	} else	{
		console.log('Page loaded successfully');
		var item = browser.document.getElementById("sidebar_signin_password");
	}
	
 





  // if (err) {
  //     console.log(err.message);
  //   } else {
  //     console.log(browser.html());
  //     browser.clickLink("#click_me", function(err, browser) {
  //       if (err) {
  //         console.log(err.message);
  //       } else {
  //         console.log(browser.lastResponse);
  //         browser.dump();
  //       }
  //     });
  //   }
});