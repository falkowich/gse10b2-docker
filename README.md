# gse10b2-docker

To try out the first sqlite build without persistant data.

```
docker run -p 443:443 falkowich/gse10b2:sqlite3
```

### WebUI:
user/pass - admin/admin

### Disclamer:
This is an unofficial test build, just to test out new beta releases.  
Much info was taken from https://github.com/mikesplain/openvas-docker that makes good production ready container builds.

More images, and better quality are hopefully coming here later :)

## ToDo / Thoughts
* postgresql build
* better volume/mount support
* better Dockerfile syntax
* better logging
* master/slave images
* suggestions are always welcome