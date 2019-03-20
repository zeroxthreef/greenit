//this file actually sets the header. I couldnt figure out a way to set a cookie, or any header for that matter by means of regular psp usage
import redis_client;

int db_index = 2;

mixed parse(object id)
{
	Redis db = Redis(0, 0, "/var/run/redis/redis.sock");
	string key = "greenit:variable:login:" + id->variables->tmp;
	
	//connect, set the db location, then do thing
	
	if(db->connect() && db->ping() && db->select(db_index))
	{
		//fetch the key to get the token
		string cookie;
		
		
		cookie = db->get(key);
		
		if(cookie)
		{
			db->del(key);
			
			//disconnect
			db->disconnect();
			
			//set the cookie and stuff. The cookie expires like 2 weeks in the future in seconds
			mapping map = HTTP.set_cookie("token", cookie, time() + 604800, id);
			map->_headers["set-cookie"] += "; HttpOnly;";
			
			return ([
			"_headers":(["set-cookie": replace(map->_headers["set-cookie"], "\r\n", "")]),
			"data":"<html><head><title>Logging in</title><meta http-equiv=\"refresh\" content=\"0; url='/'\" /></head>If you arent redirected automatically, click this link: <a href=\"/\">return to page</a></html>"
			]);
		}
		else
		{
			db->disconnect();
			return "<h1>Please log in through the login page</h1>";
		}
	}
	
	return "<h1>critical error</h1>";
}