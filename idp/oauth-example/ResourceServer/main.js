var http = require("http");
var url  = require("url");
var path = require("path");
var port = 45454;

http.createServer(function(request, response)
{
    var url_parsed = url.parse(request.url, true);
    var uri = url_parsed.pathname;
    var filename = path.join(process.cwd(), uri);
    var query = url_parsed.query;

    console.log(uri);
    console.log(filename);
    console.log(query);
    console.log(query.accessToken);

    // Check that we know of the access token
    switch(query.accessToken)
    {
        // Known, and faked access token (already in place)
        case '1337':
            // Send data back in form of a redirect
            var redirect_url = "http://mozart.cs.au.dk:45451/loggedin.html?accessToken=" + query.accessToken + "&server_data=OMG_LOTS_OF_DATA";

            response.writeHead(302, {"Location": redirect_url});
            response.end();
            return;

        // Unknown access token
        default:
            response.writeHead(403, {"Content-Type": "text/plain"});
            response.write("403 Forbidden\n");
            response.end();
            return;
    }
}).listen(parseInt(port, 10));
