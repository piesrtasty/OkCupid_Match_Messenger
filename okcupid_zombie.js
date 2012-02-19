var zombie = require("/usr/local/lib/node/node_modules/zombie");
// var zombie = require("zombie");

zombie.visit("http://www.okcupid.com/login", {debug: false, scripts: false}, function(err, browser) {
  if (err) {
    console.log(err.message);
  } else {
    // console.log(browser.html());
    browser.
      fill("username", "piesrtasty").
      fill("password", "shutup!1").
      clickLink("#login_form a:last", function(e, browswer, status)  {
        
        console.log(status);
        console.log(browser.html());

        var item = browser.document.getElementById("#home_heading");
        console.log(item);

      });


    // browser.fill("#sidebar_signin_button")

    // browser.clickLink("a#sidebar_signin_button", function(err, browser) {
    //   if (err) {
    //     console.log(err.message);
    //   } else {
    //     console.log(browser.lastResponse);
    //     browser.dump();
    //   }
    // });
  }
});
