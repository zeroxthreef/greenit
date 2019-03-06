mixed parse(object id)
{
	//kill that cookie
	mapping map = HTTP.set_cookie("token", "hey, im dying", time() - 604800, id);
	
	return ([
	"_headers":(["set-cookie": replace(map->_headers["set-cookie"], "\r\n", "")]),
	"data":"<html><head><title>Logging out</title><meta http-equiv=\"refresh\" content=\"0; url='/'\" /></head>If you arent redirected automatically, click this link: <a href=\"/\">return to page</a></html>"
	]);
}