#!/usr/bin/pike
import Tools.Logging;

inherit ScriptRunner.Runner;

constant my_version = "0.4";

#define RUN_THREADED 20

string session_storagetype = "ram";
string session_storagedir = ""; // not required for ram storage.

//string session_storagetype = "sqlite";
//string session_storagedir = "/tmp/scriptrunner_storage.db";

//string session_storagetype = "file";
//string session_storagedir = "/tmp/scriptrunner_storage";

string logfile_path = "scriptrunner.log";
string session_cookie_name = "PSESSIONID";
int session_timeout = 3600;

string mode = "SCGI";

int my_port = 9999;

Stdio.Port port;

int start_listener(int port)
{
  Log.info("Starting listener on port %d.", (int)port);
  this->port = Stdio.Port(port, answer_call);
  return -1;
}

void answer_call(int sock, int id)
{
  Stdio.File fd = port->accept();

  requests ++;
  object request_id;
  mixed e;

  if(e=catch(request_id = ScriptRunner.SCGIRequest(fd)))
  {
    fd->write("Status: 500 Server Error\r\n");
    fd->write("Content-type: text/html\r\n\r\n");
    fd->write("<h1>Error 500: Internal Server Error</h1>");
    fd->write("The server was unable to parse your request.\n");
    fd->write("<p>" + describe_backtrace(e));
    fd->close();
    throw(e);
    return;
  }
  handle_request(request_id, id);

}