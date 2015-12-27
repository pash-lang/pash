namespace Part\Lib;

class Main {

    /**
	 * Import usage:
	 *<code>
	 *      import Library\Func
	 *</code>
	 */
	 
	private static function import(plang) {
	let plang = preg_replace("/import (.*)/", "use $1;", plang);
    return plang;
	}
	
	/**
	 * File usage:
	 *<code>
	 *      file.read(location)
	 *		file.size(location)
	 *		file.ext(location)
	 *		file.write(location)
	 *</code>
	 */
	 
	private static function file(plang) {
	let plang = preg_replace("/file.read\((.*)\)/", "file_get_contents($1,true);", plang);
	let plang = preg_replace("/file.size\((.*)\)/", "filesize($1);", plang);
	let plang = preg_replace("/file.ext\((.*)\)/", "pathinfo($1, PATHINFO_EXTENSION);", plang);
	let plang = preg_replace("/file.create\((.*),(.*)\)/", "$file = fopen($1,'w'); fwrite($file, $2); fclose($file);", plang);
	
    return plang;
	}

    /**
	 * HTTP usage:
	 *<code>
	 *      http.get("url")
	 *      http.post("post")
	 *      http.request("req")
	 *		http.host()
	 *		http.referer()
	 *		http.user_agent()
	 *		http.method()
	 *		http.header()
	 *		http.ip()
	 *		http.port()
	 *</code>
	 */
	 
	private static function http(plang) {
	let plang = str_replace("http.host()", "$_SERVER['HTTP_HOST'];", plang);
	let plang = str_replace("http.referer()", "$_SERVER['HTTP_REFERER'];", plang);
	let plang = str_replace("http.user_agent()", "$_SERVER['HTTP_USER_AGENT'];", plang);
	let plang = str_replace("http.method()", "$_SERVER['REQUEST_METHOD'];", plang);
	let plang = str_replace("http.header()", "$_SERVER['HTTP_ACCEPT'];", plang);
	let plang = str_replace("http.ip()", "$_SERVER['REMOTE_ADDR'];", plang);
	let plang = str_replace("http.port()", "$_SERVER['REMOTE_PORT'];", plang);
	let plang = preg_replace("/http.get\((.*)\)/", "$_GET[$1];", plang);
    let plang = preg_replace("/http.request\((.*)\)/", "$_REQUEST[$1];", plang);
    let plang = preg_replace("/http.post\((.*)\)/", "$_POST[$1];", plang);
    return plang;
	}
	
	/**
	 * Server usage:
	 *<code>
	 *      server.self()
	 *      server.domain()
	 *      server.ip()
	 *		server.webserver()
	 *		server.protocol()
	 *		server.admin()
	 *</code>
	 */
	 
	private static function server(plang) {
	let plang = str_replace("server.self()", "$_SERVER['PHP_SELF'];", plang);
	let plang = str_replace("server.domain()", "$_SERVER['SERVER_NAME'];", plang);
	let plang = str_replace("server.ip()", "$_SERVER['SERVER_ADDR'];", plang);
	let plang = str_replace("server.port()", "$_SERVER['SERVER_PORT'];", plang);
	let plang = str_replace("server.webserver()", "$_SERVER['SERVER_SOFTWARE'];", plang);
	let plang = str_replace("server.protocol()", "$_SERVER['SERVER_PROTOCOL'];", plang);
	let plang = str_replace("server.admin()", "$_SERVER['SERVER_ADMIN'];", plang);
    return plang;
	}
	
	/**
	 * OS usage:
	 *<code>
	 *      os.kernel()
	 *      os.user()
	 *      os.type()
	 *</code>
	 */
	 
	private static function os(plang) {
	let plang = str_replace("os.kernel()", "exec('uname -r');", plang);
    let plang = str_replace("os.user()", "exec('whoami');", plang);
    let plang = str_replace("os.type()", "exec('uname -o');", plang);
    return plang;
	}
	
	/**
	 * Command usage:
	 *<code>
	 *      cmd("commands")
	 *      system("commands")
	 *      exec("commands")
	 *</code>
	 */
	 
	private static function commands(plang) {
	let plang = preg_replace("/cmd\((.*)\)/", "exec($1);", plang);
	let plang = preg_replace("/system\((.*)\)/", "exec($1);", plang);
	let plang = preg_replace("/exec\((.*)\)/", "exec($1);", plang);
    return plang;
	}


}