#!/usr/bin/pike

//this file should very rarely ever need to be updated, so we don't need to worry about exitting it upon update

import redis_client;

int db_index = 2;
string scriptrunner_location = "./ScriptRunner_SCGI.pike";
Redis db;

int main(int argc, array(string) argv)
{
	if(Process.create_process(({scriptrunner_location})))
	{
		write("Started scriptrunner script");
		
		handle_events();
		
	}
	else
		write("Unable to start the scriptrunner script. Make sure it exists at the location chosen AND has execution enabled\n");
	
	
	return 0;
}

void handle_events()
{
	int connected = 0;
	
	
	do
	{
		delay(1);
		write("connecting to redis db\n");
		db = Redis(0, 0, "/var/run/redis/redis.sock");
		db->connect();
		
		if(db->ping() && db->select(db_index))
		{
			connected++;
			write("redis db conection successful\n");
		}
		else
			write("unable to connecto to redis db\n");
	} while(!connected);
	
	
	while(1) //will run forever so...
	{
		//handles ranking posts in the viewing menu types. Would make a lua script for this, but if the db gets large enough, that could be slow
		
		
		
		
		delay(1);
	}
	
}