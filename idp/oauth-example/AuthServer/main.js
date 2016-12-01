var http = require("http");
var url  = require("url");
var path = require("path");
var fs   = require("fs");
var port = 45455;

http.createServer(function(request, response)
{
    var url_parsed = url.parse(request.url, true);
    var uri = url_parsed.pathname;
    var filename = path.join(process.cwd(), uri);
    var query = url_parsed.query;

    console.log(uri);
    console.log(filename);
    console.log(query);
    console.log(query.clientID);

    // Check that we know of the client ID
    switch(query.clientID)
    {
        // Known, and faked clientID (already in place)
        case 'brain':
            // Relative path of our login page
            var log_in_page = 'login.html';

            path.exists(log_in_page,
                function(exists)
                {
                    // In case the server is in an invalid state
                    if(!exists)
                    {
                      response.writeHead(500, {"Content-Type": "text/plain"});
                      response.end("500 Internal Error\n");
                      return;
                    }

                    // Read the login file
                    fs.readFile(log_in_page, "binary",
                        function(error, file))
                        {
                            if(error)
                            {
                                response.writeHead(500, {"Content-Type": "text/plain"});
                                response.end("500 Internal Error: " + error + "\n");
                                return;
                            }

                            // Respond with the login file.
                            response.writeHead(200, {"Content-Type": "text/html"});
                            response.end(file);
                        };
                });
            return;

        // Unknown clientID
        default:
            response.writeHead(403, {"Conent-Type": "text/plain"});
            response.write("403 Forbidden\n");
            response.end();
            return;
    }
}).listen(parseInt(port, 10));
