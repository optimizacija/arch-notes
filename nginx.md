# NGINX

Consist mostly of `directives` and `contexts`.

*Directives are key value(s) pair:*

`location`: Specifies for which urls where the request will be forwarded to.
Multiple directives can be specified. In the case where multiple locations
could be used, nginx takes the one with the longest match.

`listen`: specifies address:port - the path - for a UNIX-domain socket on which the server will accept requests.
``` nginx
listen 127.0.0.1:8000;
listen 127.0.0.1;
listen 8000;
listen *:8000;
listen localhost:8000;
listen [::]:8000;
listen [::1];
```

`root`: sets root directory for requests.
`try_files`: Checks the existence of files in the specified order and uses the first found file for request processing
`index`: sets the default index file. Multiple filenames can be provided. 
In that case it takes the first existing one (relative to the root directory).

Contexts are just a bunch of directives grouped together providing a functionality:
`http`
`server`

## Setup
Install nginx through official repositories.
test if NGINX systemd service is enabled & started.
```
sudo systemctl status nginx
```

If it's not, enable and/or start it.
```
sudo systemctl enable nginx
sudo systemctl start nginx
```

Put new nginx config to `/etc/nginx/conf.d` folder and make sure to add `.conf` suffix.
For example `example.com.conf`. Why? `/etc/nginx/nginx.conf` sources all files inside
the `/etc/nginx/conf.d` directory with `.conf` suffix.

## Angular

Build angular application
```
npm run build --prod
```

Copy contents of new `dist/<project>/` folder to `/var/www/<website.com>/`.

Create nginx setup `example.com.conf` and put it inside `/etc/nginx/conf.d`.
```
server {
  listen 8080;
  location / {
    root /var/www/example.com;
    index index.html /index.html;
    try_files $uri $uri/ /index.html?$args;
  }
}
```


Reload nginx.
```
sudo systemctl reload nginx
```
