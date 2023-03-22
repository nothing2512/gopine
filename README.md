![Alt text](public/favicon.png "Gopine")

# Gopine
[![Instagram](public/instagram.png)](https://www.instagram.com/gopine.dev/)

Gopine is a lightweight web framework using [Golang](https://go.dev/), [AlpineJS](https://alpinejs.dev/) and [Axios](https://axios-http.com/)<br>

## installation
- Download gopine executable according to your operating system [Here](https://github.com/nothing2512/gopine/releases/latest)
- Rename gopine execatable to gopine
  - example: gopine-linux-amd64 -> gopine
- To use globally, move gopine executable to your environment path
- To use locally, move gopine executable to your root project

## Directories
Directory structures, don't change naming conventions for project

    .
    ├── component           # HTML component directories
    ├── public              # Static asset directories
    ├── src                 # Source HTML files
    └── gopine.config.json  # Configuration file

## `component`
Link of component inherited from directory structure, for example :

    .
    └── component
        └── card
            └── profile.html

to get profile page, it can use url `@component/card/profile`

## `public`

Public directories used to store static assets like image, js, css, etc. You can access with ``/your-asset-location``, for example :

    .
    └── public
        └── css
            └── gopine.css

to get gopine css, you can use url `/css/gopine.css`

## `src`
Src folder used to store main html page and main routing, for example :

    .
    └── src
        ├── profile
        │    ├── index.html         # {host}/profile
        │    └── detail.html        # {host}/profile/detail
        └── users
              └── _id               # passing id to path variable
                    └── detail.html # {host}/users/{id}/detail

## Configuration

Global configuration for gopine project

```json
{
    "server": {
        "host": "server host",
        "port": "server port"
    },
    "title": "Website Title",
    "icon": "Website Icon",
    "css": [
      "list of css file to be used globally"
    ],
    "js": [
      "list of js file to be used globally"
    ],
    "jsDefer": [
      "list of js file to be used globally in defer mode"
    ],
    "meta": [
        {
            "property": "property",
            "charset": "charset",
            "content": "content",
            "name": "name",
            "http-equiv": "http-equiv"
        }
    ]
}
```
> Example
```json
{
    "server": {
        "host": "0.0.0.0",
        "port": "3333"
    },
    "title": "Gopine",
    "icon": "/favicon.png",
    "css": [
      "/css/gopine.css"
    ],
    "js": [
      "/js/gopine.js"
    ],
    "jsDefer": [
      "/js/gopine.defer.js"
    ],
    "meta": [
        {
            "property": "property",
            "charset": "UTF-8",
            "content": "content",
            "name": "name",
            "http-equiv": "http-equiv"
        }
    ]
}
```
## Usage

html file must have gopine script tag in the bottom file<br><br>
```html
<script type="application/javascript" rel="gopine"><script>
```

inject function used to inject alpine data to main system
```js
inject({})
```

to inject function inside component, it can use :
```js
injectComponent("gopine", {})
```

to load component, you can use builtin gopine function, for example :
```html
<div x-html="loadComponent('@component/card/profile')"></div>
```

Full Example :

```html
<!--suppress ALL -->
<h1 x-text="title"></h1>
<button x-on:click="setTitle()">Change</button>
<div x-html="loadComponent(component)"></div>
<script type="application/javascript" rel="gopine">
    inject({
        "title": "Title",
        "component": "@component/card/profile",
        setTitle() {
            this.title = "Gopine"
        }
    })
</script>
```

## Running
- using global gopine executable
  ```shell
  $ cd <your-root-project>
  $ gopine
  ```
- using local gopine executable
  ```shell
  $ cd <your-root-project>
  $ ./gopine
  ```

## Containerization

Gopine support [docker](https://www.docker.com/) to containerize project, to containerize your project, you must have installed [docker](https://www.docker.com/) on your system.
```shell
  $ cd <your-root-project>
  $ docker build . -t project-name:project-version
  $ docker run --name project-name -p 3333:3333 -d project-name:project-version
  ```

## License
See [LICENSE.md](./LICENSE.md).